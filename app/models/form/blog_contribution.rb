class Form::BlogContribution
  include ActiveModel::Model

  attr_accessor :author, :blog, :title, :body, :tags_string, :status

  validates :author, presence: true
  validates :title, presence: true, length: { maximum: 64 }
  validates :body, presence: true, length: { maximum: 10000 }
  validates :status, presence: true, inclusion: { in: Blog.statuses.keys }

  def save
    return false unless valid?
    self.blog = Blog.create(author: author, title: title, body: body, status: status)
  end

  def self.build_from(original)
    new(title: original.title, body: original.body, status: original.status)
  end
end