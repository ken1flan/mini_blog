class Form::BlogContribution
  include ActiveModel::Model

  attr_accessor :author, :blog, :title, :body, :tags_string, :status

  validates :author, presence: true
  validates :title, presence: true, length: { maximum: 64 }
  validates :body, presence: true, length: { maximum: 10000 }
  validates :status, presence: true, inclusion: { in: Blog.statuses.keys }

  def save
    return false unless valid?
    # FIXME: updating probrem
    self.blog = Blog.create(author: author, title: title, body: body, status: status)
    self.blog.tags = []
    self.blog.tags = tags
  end

  def self.build_from(original)
    tags_string = original.tags.map(&:name).join(',')
    new(title: original.title, body: original.body, tags_string: tags_string, status: original.status)
  end

  private
  def tags
    self.tags_string.split(',').map(&:strip).select(&:present?).uniq.map do |name|
      tag = Tag.find_by(name: name)
      tag ||= Tag.create(name: name)
    end
  end
end