class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	

	def index
		@posts = Post.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
	end

	def show

	end

	def new
		@post = current_user.post.build
	end


	#def check_auth
	#	if session[:user_id] != @post.user_id
	#		flash[:notice] = "Sorry, you can't edit this post"
	#		redirect_to posts_path
	#	end
	#end

	def edit
		
	end

	def create
    @post = Post.new(title: params[:post][:title], user_id: current_user.id)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Post was succefully updated"
		else
			render action: 'edit'
	end

	def destroy
		@post.destroy
		redirect_to posts_url
	end

	private
		def set_post
			@post = Post.find(params[:id])
		end

		def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "Not authorized to edit this post" if @post.nil?
    end

		def post_params
			params.require(:post).permit(:title)
		end
	end
end