require 'twitter'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "zOpp3M8RjMHMl28od94Vl1cl8"
  config.consumer_secret     = ENV['twitter_consumer_secret']
  config.access_token        = "918105217740279808-mHqDxrm9Q5sVVPB602PnB8aqh4oLivG"
  config.access_token_secret = ENV['twitter_access_token_secret']
end

clientRT = Twitter::REST::Client.new do |config|
  config.consumer_key        = "zOpp3M8RjMHMl28od94Vl1cl8"
  config.consumer_secret     = ENV['twitter_consumer_secret']
  config.access_token        = "918105217740279808-mHqDxrm9Q5sVVPB602PnB8aqh4oLivG"
  config.access_token_secret = ENV['twitter_access_token_secret']
end

search_options = {
  result_type: "recent",
  geocode: "48.8,2.35",
  track: "faim, manger",
}

client.filter(search_options) do |tweet|
	#client.update("hello @#{tweet.user.screen_name} ,tu peux manger pas cher avec mon super code promo !")

	if tweet.user.screen_name != "YummyTHP"
		#puts "@#{tweet.user.screen_name}"

		begin
		  	clientRT.retweet(tweet)
		  	clientRT.follow!([tweet.user])
			clientRT.favorite!([tweet])
		rescue Twitter::Error::Forbidden => e  
			puts "Tweet déjà utilisé"
		end
	end
end






