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
		  puts "============="
		  puts response.inspect
		  puts "============"

 

	end
	def scrape
  		url = 'https://www.google.com/search?q=' +
  		response = VehiclesSpider.process(url)
  if response[:status] == :completed && response[:error].nil?
    flash.now[:notice] = "Successfully scraped url"
  else
    flash.now[:alert] = response[:error]
  end
rescue StandardError => e
  flash.now[:alert] = "Error: #{e}"
end
	def post_params
		params.permit(:post,:user_id)
	end
end
