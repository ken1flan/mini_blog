# frozen_string_literal: true

class Form::BlogContribution
  include ActiveModel::Model

  attr_accessor :author, :blog, :title, :body, :tags_string, :status

  validates :author, presence: true
  validates :title, presence: true, length: { maximum: 64 }
  validates :body, presence: true, length: { maximum: 10_000 }
  validates :status, presence: true, inclusion: { in: Blog.statuses.keys }

  def save
    return false unless valid?
    blog.attributes = { author: author, title: title, body: body, status: status }
    blog.save
    blog.tags = []
    blog.tags = tags
  end

  def self.build_from(original)
    tags_string = original.tags.map(&:name).join(',')
    new(
      title: original.title,
      body: original.body,
      tags_string: tags_string,
      status: original.status,
      blog: original,
      author: original.author
    )
  end

  private

  def tags
    tags_string.split(',').map(&:strip).select(&:present?).uniq.map do |name|
      Tag.find_by(name: name) || Tag.create(name: name)
    end
  end
end
