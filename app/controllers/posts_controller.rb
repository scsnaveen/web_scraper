class PostsController < ApplicationController
	def new
		@post = Post.new
	end
	def create
		@post =Post.new(post_params)
		@post.user_id =current_user.id
		@post.save!
		post_details = Post.process(@post.post)
		redirect_to "https://www.google.com/search?q=" +@post.post
		url = "https://www.google.com/search?q=" +@post.post
		  response = PostData.process(url)

	end
	def post_params
		params.permit(:post,:user_id)
	end
end
