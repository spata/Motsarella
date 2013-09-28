require 'ostruct'

class Libs < ActiveRecord::Base

	ADJ = "Adjective"
	NOUN = "Noun"
	ENDSPEECH = ""


	set_primary_key :title
	attr_accessible :text, :title
	validates :title, presence: true,
				length: {minimum: 5}
	validates :text, presence:true,
				length:{minimum:100}
			
 	def generateLib
 		array = Array.new(3)
 		array[0] = OpenStruct.new
 		array[0].text = "first text before blank"
 		array[0].blank = ADJ

 		array[1] = OpenStruct.new
 		array[1].text = "and some more text"
 		array[1].blank = NOUN

 		array[2] = OpenStruct.new
 		array[2].text = "last piece of text"
 		array[2].blank = ENDSPEECH

 		return array

 	end
 # attr_accessible :, :text, :title
end
