class HashtagsController < ApplicationController

	def show
		hashtag = Hashtag.find(params[:id])
		@hashtags = Hashtag.where(tag: hashtag.tag).first(5)
	end
end
