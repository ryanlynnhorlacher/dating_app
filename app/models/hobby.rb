class Hobby < ApplicationRecord
	belongs_to :person
	validates_presence_of :name
end
