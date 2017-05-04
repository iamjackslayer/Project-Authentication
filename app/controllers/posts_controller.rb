class PostsController < ApplicationController
	before_action :current_user_is_signed_in?, only:[:new, :create]
  def new
  	@post = Post.new
  end

  def create
  	if current_user_is_signed_in?
	  	@post = Post.create(comment: params[:post][:comment], user_id: current_user.id)
	  	redirect_to posts_index_path
	else
		@post = Post.create(comment: params[:post][:comment], user_id: nil)
		redirect_to posts_index_path
	end
  end

  def index
  	@posts = Post.all
  end
end
