# frozen_string_literal: true

class My::BlogsController < ApplicationController
  before_action :require_signed_in

  def index
    @blogs = current_user.blogs.normal_order.includes(:author, :tags).page(params[:page])
  end

  def show
    @blog = current_user.blogs.find(params[:id])
  end
end
