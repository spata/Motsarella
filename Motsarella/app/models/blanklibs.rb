class Blanklibs < ActiveRecord::Base
	attr_accessible :text, :title
	validates :title, presence: true,
				length: {minimum: 5}
	validates :text, presence:true,
				length:{minimum:100}
			

 # attr_accessible :, :text, :title
end
