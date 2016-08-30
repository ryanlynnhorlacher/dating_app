require 'rails_helper'

RSpec.describe Person, type: :model do
	it {should have_many(:hobbies)}
	it {should have_one(:address)}
	it {should have_many(:messages)}
	it {should validate_presence_of(:name)}
	it {should validate_presence_of(:age)}
	it {should validate_presence_of(:gender)}

	it "returns a record when search matches a column" do
	person1 = Person.create(name: 'ryan', age: 30, gender: 'male')
	person2 = Person.create(name: 'lonnie', age: 28, gender: 'male')
	expect(Person.search('ryan','','','','','')).to eq(person1)
end
end