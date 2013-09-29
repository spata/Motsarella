require 'ostruct'
require 'net/http'
require 'rexml/document'


class Libs < ActiveRecord::Base



	ADJ = "Adjective"
	NOUN = "Noun"
	VERB = "Verb"
	ADV = "Adverb"
	ENDSPEECH = ""


	set_primary_key :title
	attr_accessible :text, :title, @blank

	validates :title, presence: true,
				length: {minimum: 5}

			
 	def generateLib
 	
 		pre  = Array.new

		text2 = self.text.split(" ")


		parsed = Array.new(text2)

		#nouns = getnouns(parsed)
		#adjs = getnouns(parsed)
		# filter -ing verbs
		acc=""
		entry = OpenStruct.new()
		parsed.each { |word| 
			entry= OpenStruct.new()
			entry.filledin =""
			if (word =~ /.*ing$/ )
				entry.pos =  VERB
				entry.before =  acc
				entry.word = word
				pre.push entry
				acc =""
			elsif (word =~ /.*ly$/ ) 
				entry.pos =  ADV
				entry.before =  acc
				entry.word = word
				pre.push entry
				acc =""
=begin
			elsif (nouns.include? word) 
				entry.pos =  NOUN
				entry.before =  acc
				entry.word = word
				pre.push entry
				acc =""
			elsif (adj.include? word) 
				entry.pos =  ADJ
				entry.before =  acc
				entry.word = word
				pre.push entry
				acc =""=end
=end

			else
				acc = acc + " "+ word
			end
		}
=begin
		entry = OpenStruct.new()
		entry.before = acc
		entry.word=""
		pre.push entry=end
=end

		@blank = Array.new()
		@blank = getblanks(pre)
		

 		return @blank

 	end



def checkDictionary(word)
	result =""
	
	# get the XML data as a string
	
	xml_data = Net::HTTP.get(URI.parse('http://www.dictionaryapi.com/api/v1/references/collegiate/xml/'+word+'?key=e0c03354-5753-4456-a1d7-6444244820db'))
	
	# extract information
	doc = REXML::Document.new(xml_data)
	pos = []
	doc.elements.each('entry_list/entry/fl') do |ele|
	   pos << ele.text
	end


	# collect all part of speech information into a list
	poslist = Array.new
	pos.each_with_index do |pos, idx|
	   poslist.push "#{pos}"
	end



	# make the hash default to 0 so that += will work correctly
	h = Hash.new(0)

	# iterate over the array, counting duplicate entries
	poslist.each do |v|
	  h[v] += 1
	end



	return h
end



pre  = Array.new
blanks  = Array.new
maybe  = Array.new

#word list
def getblanks(wordlist)
	b=Array.new

	wordlist.each { |word| 
	# count how many POS the word has
	if(word != nil ) 
		if (word.word.length >3 || word.word.length==0) 
			posHash = checkDictionary(word.word)
			count = posHash.keys.length

			if (count ==1)

				b.push word

			end 
		end
	end

	}
	return b
	

end

# text to parse

=begin
#gets adjectives
def getadjs(wordlist)
	b=Array.new

	wordlist.each { |word| 
	# count how many POS the word has
	if(word != nil && word != "") 
		if (word.length >3) 
			posHash = checkDictionary(word)
			count = posHash.keys.length

			if (count ==1&&posHash.keys.pop=="adjective")

				b.push word

			end 
		end
	end
	}
	return b

end
#gets nouns
def getnouns(wordlist)
	b=Array.new

	wordlist.each { |word| 
	# count how many POS the word has
	if(word != nil && word != "") 
		if (word.length >3) 
			posHash = checkDictionary(word)
			count = posHash.keys.length

			if (count ==1&&posHash.keys.pop==)

				b.push word

			end 
		end
	end
	}
	return b=end


end
=end
 # attr_accessible :, :text, :title
end

