class PostsController < ApplicationController
	
before_action :get_post, only: [:edit, :update, :destroy]
before_action :check_auth, only: [:edit, :update, :destroy]

	def get_post
		@post = Post.find(params[:id])
	end

	def index

	end

	def show

	end

	def check_auth
		if session[:user_id] != @post.user_id
			flash[:notice] = "Sorry, you can't edit this post"
			redirect_to posts_path
		end
	end

	def edit
		
	end

	def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

	def update

	end

	def destroy

	end

end