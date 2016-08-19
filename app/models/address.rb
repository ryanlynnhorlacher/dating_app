class Address < ApplicationRecord
	belongs_to :person
	validates_presence_of :street_address, :city, :state, :zip
end
