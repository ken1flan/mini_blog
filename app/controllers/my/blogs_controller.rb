# frozen_string_literal: true

class My::BlogsController < ApplicationController
  before_action :require_signed_in
  before_action :set_blog, only: %i[show edit update]

  def index
    @blogs = current_user.blogs.normal_order.includes(:author, :tags).page(params[:page])
  end

  def new
    @blog_contribution = Form::BlogContribution.new
    @blog_contribution.blog = current_user.blogs.new
  end

  def create
    @blog_contribution = Form::BlogContribution.new(blog_params)
    @blog_contribution.blog = current_user.blogs.new

    if @blog_contribution.save
      redirect_to blog_path(id: @blog_contribution.blog.id), notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def show
    # Only before action
  end

  def edit
    @blog_contribution = Form::BlogContribution.build_from(@blog)
  end

  def update
    @blog_contribution = Form::BlogContribution.new(blog_params)

    if @blog_contribution.save
      redirect_to blog_path(id: @blog_contribution.blog.id), notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_blog
    @blog = current_user.blogs.includes(:author, :tags).find(params[:id])
  end

  def blog_params
    params
      .require(:form_blog_contribution)
      .permit(:title, :body, :tags_string, :status)
      .merge(author: current_user, blog: @blog)
  end
end
