class CommentsController < ApplicationController
	#We won't update comments; we can just make them and delete them.
	#..and we won't have a def new here, since we we always need to comment *on* something.

	def create
		@tweet = Tweet.find(params[:tweet_id])
		@comment = @tweet.comments.create(params.require(:comment).permit(:comment))
		redirect_to tweets_path
	end


	def destroy
	end
end
