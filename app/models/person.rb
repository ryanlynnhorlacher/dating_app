class Person < ApplicationRecord
	has_many :hobbies, dependent: :destroy
	has_one :address, dependent: :destroy
	has_many :messages, dependent: :destroy
	validates_presence_of :name, :age, :gender

	@users = People.all
	def user(user_info)
		@user = user_info
	end

	def validate_user
		for @users do |user|
			if user[:username] == @user[:username]
				if user[:password] == @user[:password]
					true
				else
					false
				end
			else
				false
			end
		end
	end

	def search_hair(color)
		Person.all.where(hair_color: color)
	end

	def self.hair_color
		['blond', 'brown', 'black', 'red', 'grey', 'other']
	end

	def search_eye(color)
		Person.all.where(eye_color: color)
	end

	def self.eye_color
		['blue', 'hazel', 'brown', 'grey', 'green', 'cat']
	end

	def search_gender(gender)
		Person.all.where(gender: gender)
	end

	def self.gender
		['female', 'male']
	end

	def search_age(age)
		Person.all.where(age: > (age - 5) AND age: < (age + 5))
	end

	def search_height(height)
		Person.all.where(height: > (height - 4) AND height: < (height + 4))
	end

	def search_weight(weight)
		Person.all.where(weight: > (weight - 20) AND weight: < (height + 20))
	end
end

