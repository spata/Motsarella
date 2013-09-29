require "open-uri"
require "simple-rss"
require "rubygems"
require 'nokogiri'
#class FeedsController < ApplicationController
	#def feed
		feedBurner = "?fmt=xml"
		theOnion = "http://feeds.theonion.com/theonion/daily"
		bbc = "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml"
		reddit = "http://www.reddit.com/search.xml?q=RSS+Readers&sort=new" #["http://www.reddit.com/search.xml?q=RSS+Readers&sort=", topic].join("")
		engadget = "www.engadget.com/rss.xml"
		cracked = "http://feeds.feedburner.com/CrackedRSS?fmt=xml"
		theVerge = 'http://www.theverge.com/rss/frontpage'

		rss = SimpleRSS.parse(
			open(theVerge)
	 		)
		#puts rss
		theLink = rss.feed.link
		puts theLink
		# page = Nokogiri::HTML(open(theLink))   
		# puts page.class 
		# mainCon = page.css('div#main-content')[0] 
		# res = mainCon.css('p').text
		# result = String.try_convert(res)
		# return result
	#end
	

#end
