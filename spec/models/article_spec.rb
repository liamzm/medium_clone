require 'rails_helper'

RSpec.describe Article, :type => :model do


  	it "is not valid without a title" do
  		article = Article.new(title: nil)
  		expect(article).to_not be_valid
	end

	it "belongs to user" do
		article = Article.reflect_on_association(:user)
   		expect(article.macro).to eq(:belongs_to)
  	end


end