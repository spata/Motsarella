
require 'cgi'
require "open-uri"
require "simple-rss"
require "rubygems"
require 'nokogiri'
class LibsController < ApplicationController


	def blanks
		@libs = Libs.find(params)
	end

	def fill 

		@libs = Libs.find(params['lib_id'.to_sym()])
		@par = params

	end

	def edit
		@libs = Libs.find(params[:id])
		@result = @libs.generateLib()
	end

	def index
		@libs = Libs.all
	end

	def create
		@libs = Libs.new(params[:libs])
		length = @libs.text.length
		if length <= 100
			@libs.text = feed
			@libs.blank = Array.new()
			#issue: madlibs with the same title overwrite each other
		end
		

	 	if @libs.save
	 	#	@libs.blank="automated"
	 		render "show"
	 	else
	 		render "new"
	 	end
	 	
	 	#else
	 	#	@libs.errors.add("We're sorry. That name is already taken.")
	 	#	render "new"
	 	#end
	end

	def new
		@libs = Libs.new

	end


	def show 

		@libs = Libs.find(params[:id])
	end

	def feed
		String topic = "fun"
		theOnion = "http://feeds.theonion.com/theonion/daily"
		bbc = "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml"
		reddit = "http://www.reddit.com/search.xml?q=RSS+Readers&sort=new" #["http://www.reddit.com/search.xml?q=RSS+Readers&sort=", topic].join("")
		engadget = "www.engadget.com/rss.xml"
		cracked = "http://feeds.feedburner.com/CrackedRSS?fmt=xml"
	
		rss = SimpleRSS.parse(
			open(bbc)
	 		)
		#puts rss
		theLink = rss.feed.link
		puts theLink
		page = Nokogiri::HTML(open(theLink))   
		puts page.class 
		mainCon = page.css('div#main-content')[0] 
		res = mainCon.css('p').text
		#puts res #for Testing
		result = String.try_convert(res)
		#puts result #for test
		return result
	end

end

