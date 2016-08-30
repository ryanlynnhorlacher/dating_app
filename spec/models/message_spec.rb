require 'rails_helper'

RSpec.describe Message, type: :model do
	it {should validate_presence_of(:content)}
	it {should validate_presence_of(:to)}
	it {should belong_to(:person)}
end