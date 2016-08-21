class Person < ApplicationRecord
	has_many :hobbies, dependent: :destroy
	has_one :address, dependent: :destroy
	has_many :messages, dependent: :destroy
	validates_presence_of :name, :age, :gender

	def self.search(name, age, gender, eye_color, hair_color, weight, height)
    	if name || age || gender || eye_color || hair_color || height || weight
    		Person.all.where(name: name) if name =~ /.+/
    		if age =~ /\d+/
    			ages = []
    			low_age = age.to_i - 5
    			for i in 0..10 
    				ages  << "#{low_age + i}"
    			end
    		end
    		Person.all.where(age: ages) if age =~ /\d+/
    		Person.where(gender: gender) if gender =~ /.+/
    		Person.where(eye_color: eye_color) if eye_color =~ /.+/
    		Person.where(hair_color: hair_color) if hair_color =~ /.+/
    		if weight =~ /\d+/
    			weights = []
    			low_weight = weight.to_i - 20
    			for i in 0..40
    				weights << "#{low_weight + i}"
    			end
    		end
    		Person.where(weight: weights) if weight =~ /\d+/
    		if height =~ /\d+/
    			heights = []
    			low_height = height.to_i - 4
    			for i in 0..8
    				heights << "#{low_height + i}"
    			end
    		end
    		Person.where(height: heights) if height =~ /\d+/

    	else
    		Person.all
    	end

	end

	def self.hair_color
		['blond', 'brown', 'black', 'red', 'grey', 'other']
	end

	def self.eye_color
		['blue', 'hazel', 'brown', 'grey', 'green', 'cat']
	end


	def self.gender
		['female', 'male', 'transgender']
	end
end

