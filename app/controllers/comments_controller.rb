class CommentsController < ApplicationController
	before_action :authenticate_user!, :except => [:create]

	def create
		@post = Post.find(params[:post_id])
	 	@comment = @post.comments.create(params[:comment].permit(:name, :comment))
		redirect_to post_path(@post)	
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		if @post.user_id == current_user.id
			@comment.destroy
		end
		redirect_to post_path(@post)
	end
end