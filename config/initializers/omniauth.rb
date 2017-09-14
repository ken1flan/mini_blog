# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_OAUTH_CLIENT_ID'], ENV['GOOGLE_OAUTH_CLIENT_SECRET'], scope: 'email,profile'
end
OmniAuth.config.full_host = ENV['MINI_BLOG_URL']
