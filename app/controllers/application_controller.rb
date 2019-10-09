# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :user_signed_in?, :current_user, :markdown_to_html

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end

  def user_signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_signed_in
    return if user_signed_in?

    flash[:error] = 'You must be logged in to access this section.'
    redirect_to root_path
  end

  def markdown_to_html(markdown_text)
    @markdown ||= Redcarpet::Markdown.new(
      markdown_renderer,
      fenced_code_blocks: true,
      autolink: true,
      tables: true
    )
    @markdown.render(markdown_text).html_safe
  end

  private

  def markdown_renderer
    Redcarpet::Render::HTML.new(filter_html: true,
                                hard_wrap: true,
                                lax_html_blocks: true,
                                no_intra_emphasis: true,
                                strikethrough: true,
                                superscript: true)
  end
end
