class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    render json:{post:post}
    post = Post.create(content: params[:content], checked: false)
  end

  def checked 
    post = Post.find(params[:id])
    if post.checked then
      post.update(checked: false)
    else
      post.update(checked: true)
    end
    render json:{post:item}
    item = Post.find(params[:id])
  end
end