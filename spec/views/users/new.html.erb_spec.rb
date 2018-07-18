require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
describe "new.html.erb" do 

	context "page contains a form to create a new user" do

			it "raise an error if wrong input is given" do
			visit(new_user_path)
			fill_in(:first_name, :with => 'Bob')
			fill_in(:last_name, :with => 'Bob')
    		fill_in(:password, :with => 'mypassword')
    		expect { find_field(:password).value }.to raise_error
      	end  
      end
  end