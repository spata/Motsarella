#!/usr/bin/ruby
string1 = "I will drill for a well in the walla walla washington lalala and lala a place in the livingroom."

nounsearch = [" the "," a "]
nouns = Array.new
temp = String.new(string1)


for word in nounsearch
	temp = String.new(string1)
	i = temp.rindex(word)
	while(i!=nil)do
		nouns.push temp[i,word.length]
		temp = temp[0,i]
		i = temp.rindex(word)
	end
end

#puts nouns.length
#nouns.each { |j| print j, "\n" }

def checkDictionary(word)
	result =""
	#result = "http://www.dictionaryapi.com/api/v1/references/" + "collegiate" + "/xml/" + word + "?key=" + "e0c03354-5753-4456-a1d7-6444244820db"
		
	require 'net/http'
	require 'rexml/document'
	
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

	h.each do |k, v|
	  #puts "#{k} appears #{v} times"
	end

	return h
end

string2 = "One of England's most senior police officers has called for class-A drugs to be decriminalised and for the policy of outright prohibition to be radically revised.

In a dramatic move that will reignite the debate over the so-called war on drugs, Mike Barton, Durham's chief constable, has suggested that the NHS could supply drugs to addicts, breaking the monopoly and income stream of criminal gangs.

Comparing drugs prohibition to the ban on alcohol in 1920s America that gave rise to Al Capone and the mafia, Barton argues that criminalising the trade in drugs has put billions of pounds into the pockets of criminal gangs.

Drug policy reformers have praised Barton's challenge to the status quo as sensible and courageous."

pre  = Array.new
blanks  = Array.new
maybe  = Array.new

#word list
def getblanks(wordlist)# = string2.split(" ")
	b=Array.new
	wordlist.each { |word| 
	# count how many POS the word has
	if (word.length >3) 
		posHash = checkDictionary(word)
		count = posHash.keys.length

		if (count ==1)
			b.push word
		else puts "miss: "+word
		end 
	end
	}
	return b
end

# text to parse
text = string2.split(" ")


parsed = Array.new(text)
# filter -ing verbs
parsed.each { |word| 
	if (word =~ /.*ing$/ ) 
		pre.push word
	elsif (word =~ /.*ly$/ ) 
		pre.push word
	end
}
# nouns and adjectives -------------------------------------

#pre.each { |j| puts j, "  !\n" }

# a
blanksPOC = getblanks(pre)
blanks.each { |j| puts j, "\n" }




