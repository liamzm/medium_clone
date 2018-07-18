require 'rails_helper'

describe "security", :type => :feature do

  	it "signs users up and redirects to index page" do
	    visit new_user_path
	    fill_in "Email", :with => "newuser@newuser.com"
	    fill_in "Password", :with => "mypassword1"
	    fill_in "First name", :with => "New"
	    fill_in "Last name", :with => "User"
	    click_button "Create User"

	    expect(current_path).to eql(root_path)
  	end

  	it "clicking on sign up leads to sign up path" do
	  	visit root_path
	  	click_link('Sign Up')

	  	expect(current_path).to eql(new_user_path)
	end

	
	

end