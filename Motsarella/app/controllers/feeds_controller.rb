require "open-uri"
require "simple-rss"
require "rubygems"
require 'nokogiri'
#class FeedsController < ApplicationController
	String topic = "fun"
	theOnion = "http://feeds.theonion.com/theonion/daily"
	bbc = "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml"
	reddit = "http://www.reddit.com/rss.xml" #["http://www.reddit.com/search.xml?q=RSS+Readers&sort=", topic].join("")
	engadget = "www.engadget.com/rss.xml"
	# stuff = open(theOnion).read
	#puts open(bbc).read
	rss = SimpleRSS.parse(
		open(bbc)
	 	)
	#puts rss
	theLink = rss.feed.link
	puts theLink
	# puts (
	# 	open(theLink).read
	# 	)
	# rss.items.each do|i|
 #   	puts "Title: #{i.title}"
 #   	puts "Link: #{i.link}"
 #   	puts "=" * 80

#end
