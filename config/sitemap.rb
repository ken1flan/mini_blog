# frozen_string_literal: true

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = ENV['MINI_BLOG_URL']

SitemapGenerator::Sitemap.create do
  add blogs_path, priority: 0.7, changefreq: 'daily'
  Blog.published.find_each do |blog|
    add blog_path(blog), lastmod: blog.updated_at
  end

  add tags_path, priority: 0.7, changefreq: 'daily'
  Tag.find_each do |tag|
    lastmod = tag.blogs.published.maximum(:updated_at)
    lastmod ||= tag.updated_at
    add tag_path(tag), lastmod: lastmod
  end
end
