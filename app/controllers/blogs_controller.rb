# frozen_string_literal: true

class BlogsController < ApplicationController
  def index
    @blogs = Blog.published.normal_order.includes(:author, :tags).page(params[:page])
  end

  def show
    @blog = Blog.includes(:author, :tags).find(params[:id])
  end
end
