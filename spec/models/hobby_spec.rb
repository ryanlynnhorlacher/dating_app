require 'rails_helper'

RSpec.describe Hobby, type: :model do
	it {should belong_to(:person)}
	it {should validate_presence_of(:name)}
	
end