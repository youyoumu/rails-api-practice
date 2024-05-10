class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    posts = Post.all
    render json: posts
  end

  def show
    render json: @post
  end

  def new
    post = Post.new
    render json: post
  end

  def edit
    render json: @post
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: post, status: :created, location: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post, status: :ok, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    render json: {}
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
