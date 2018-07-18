require 'rails_helper'

RSpec.describe User, :type => :model do

	it "is not valid without a first_name" do
		user = User.new(first_name: nil)
  		expect(user).to_not be_valid
	end

  	it "should have many articles" do
    	user = User.reflect_on_association(:articles)
   		expect(user.macro).to eq(:has_many)
  	end

	describe User, 'validations' do
  		it { should validate_uniqueness_of(:email) }
	end

	it "should fail with password without numbers" do
		user = User.new(password: 'mypassword')
		expect(user).to_not be_valid
	end

	it "should be password including both letters and numbers" do
		user = User.new(password: 'mypassword1')
		expect(user).to be_valid
	end




end