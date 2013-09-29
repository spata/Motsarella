require "open-uri"
require "simple-rss"
require "rubygems"
#class FeedsController < ApplicationController
	theOnion = "http://fulltextrssfeed.com/feeds.theonion.com/theonion/daily"
	bbc = "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml"
	# stuff = open(theOnion).read
	#puts open(bbc).read
	rss = SimpleRSS.parse(
		open('http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml')
	 	)
	puts rss
	theLink = rss.feed.link
	puts theLink
	puts (
		open(theLink).read
		)
	# rss.items.each do|i|
 #   	puts "Title: #{i.title}"
 #   	puts "Link: #{i.link}"
 #   	puts "=" * 80

#end
