class Person < ApplicationRecord
	has_many :hobbies, dependent: :destroy
	has_one :address, dependent: :destroy
	has_many :messages, dependent: :destroy
	validates_presence_of :name, :age, :gender
end
