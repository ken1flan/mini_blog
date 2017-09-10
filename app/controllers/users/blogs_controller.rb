class Users::BlogsController < ApplicationController
  before_action :set_user

  def index
    @blogs = @user.blogs.normal_order
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
