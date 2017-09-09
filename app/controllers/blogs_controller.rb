class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :editable?, only: [:edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.published
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog_contribution = Form::BlogContribution.new
  end

  # GET /blogs/1/edit
  def edit
    @blog_contribution = Form::BlogContribution.build_from(@blog)
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog_contribution = Form::BlogContribution.new(blog_params)

    if @blog_contribution.save
      redirect_to blog_path(id: @blog_contribution.blog.id), notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    @blog_contribution = Form::BlogContribution.new(blog_params)

    if @blog_contribution.save
      redirect_to blog_path(id: @blog_contribution.blog.id), notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.
      require(:form_blog_contribution).
      permit(:title, :body, :tags_string, :status).
      merge(author: current_user)
  end

  def editable?
    not_found unless @blog.editable?(current_user)
  end
end
