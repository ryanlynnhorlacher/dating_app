class Person < ApplicationRecord
	has_many :hobbies, dependent: :destroy
	has_one :address, dependent: :destroy
	has_many :messages, dependent: :destroy
	validates_presence_of :name, :age, :gender

	@users = Person.all
	@search_result = []
	def user(user_info)
		@user = user_info
	end

	def validate_user
		@users.each do |user|
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
		if @search_result.empty?
			new_search = Person.all.where(hair_color: color)
			new_search.each do |result|
				@search_result << result
			end
		else
			@search_result.each do |result|
				if result[:hair_color] == color
					@search_result << result
				end
			end
		end
	end

	def self.hair_color
		['blond', 'brown', 'black', 'red', 'grey', 'other']
	end

	def search_eye(color)
		if @search_result.empty?
			new_search = Person.all.where(eye_color: color)
			new_search.each do |result|
				@search_result << result
			end
		else
			@search_result.each do |result|
				if result[:eye_color] == color
					@search_result << result
				end
			end
		end
	end

	def self.eye_color
		['blue', 'hazel', 'brown', 'grey', 'green', 'cat']
	end

	def search_gender(gender)
		if @search_result.empty?
			new_search = Person.all.where(gender: gender)
			new_search.each do |result|
				@search_result << result
			end
		else
			@search_result.each do |result|
				if result[:gender] == gender
					@search_result << result
				end
			end
		end
	end

	def self.gender
		['female', 'male']
	end

	def search_age(age)
		ages = ((age - 5)..(age + 5)).to_a
		if @search_result.empty?
			new_search = Person.where(age: ages)
			new_search.each do |result|
				@search_result << result
			end
		else
			@search_result.each do |result|
				if result[:age] > (age - 5) && result[:age] < (age + 5)
					@search_result << result
				end
			end
		end
	end

	def search_height(height)
		heights = ((height - 6)..(height + 6)).to_a
		if @search_result.empty?
			new_search = Person.all.where(height: heights)
			new_search.each do |result|
				@search_result << result
			end
		else
			@search_result.each do |result|
				if result[:height] > (height - 4) && result[:height] < (height + 5)
					@search_result << result			
				end
			end
		end
	end

	def search_weight(weight)
		weights = ((weight - 6)..(weight + 6)).to_a
		if @search_result.empty?
			new_search = Person.all.where(weight: weights)
			new_search.each do |result|
				@search_result << result
			end
		else
			@search_result.each do |result|
				if result[:weight] > (weight - 20) && result[:weight] < (weight + 5)
					@search_result << result
				end
			end
		end
	end

	def clear_search
		@search_result = []
	end
end

