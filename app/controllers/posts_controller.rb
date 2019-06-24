class PostsController < ApplicationController
    before_action :authenticate_user!, :except => [:show, :index]
    before_action :find_post, only: [:show, :update, :edit, :destroy]

   def index
       @posts = Post.all.order("created_at DESC")
   end

   def new
       @post = current_user.posts.build
   end

   def create
    @post = current_user.posts.build(post_params)
    puts params[:category_ids]

    if @post.save
        redirect_to root_path
    else
        render 'new'
    end
    end

   def show
    @categories = @post.categories
   end

   def update

    if @post.update(post_params)
        redirect_to post_path(@post)
    else
        render 'edit'
    end
   end

   def edit
    if @post.user_id == current_user.id
        @categories = @post.categories.all
    else
        redirect_to post_path(@post)
    end
   end

   def destroy
    if @post.user_id == current_user.id
        @post.destroy
        redirect_to root_path
    else
        redirect_to post_path(@post)
    end

   end

   private

   def post_params
       params.require(:post).permit(:title, :content, :category_ids => [])
   end

   def find_post
   	@post = Post.find(params[:id])
   end

end