class TweetsController < ApplicationController
	def index
		#show all tweets
		@tweets = Tweet.all
		@users = User.all
	end

	def new
		#form for new tweet
		#make sure we're signed in; if not, go sign in.
		if session[:id].nil?
			puts "*********NOT SIGNED IN FOR TWEETING***********"
			redirect_to "/signin"
		else
		@tweet = Tweet.new
		end
	end

	def create
		if session[:id].nil?
			puts "************NOT SIGNED IN FOR POSTING TWEET"
			redirect_to "/signin"
		else
		puts params[:tweet][:tweet]
		Tweet.create(tweet: params[:tweet][:tweet], user_id: session[:id])
		redirect_to new_tweet_path
		end
	end

	def edit
		#form to edit tweet
	end

	def update
		#process edits
	end

	def destroy
		#delte tweet
	end


end
