class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :user_signed_in?, :current_user, :markdown_to_html

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def user_signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def markdown_to_html(markdown_text)
    @markdown ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(hard_wrap: true),
      autolink: true
    )
    @markdown.render(markdown_text).html_safe
  end
end
