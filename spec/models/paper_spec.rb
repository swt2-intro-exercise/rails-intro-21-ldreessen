require 'rails_helper'

RSpec.describe Paper, type: :model do
    it "should have a constructor that can create paper instances" do
		paper = Paper.new
		expect(paper).to be_an_instance_of(Paper)
	  end
	
	  it "should should correctly set attributes during instance creation" do
		title = "MyString"
		venue = "MyString"
		year = 1
		paper = Paper.new(title: title, venue: venue, year: year)
	
		expect(paper.title).to eq(title)
		expect(paper.venue).to eq(venue)
		expect(paper.year).to eq(year)
	  end
	
	  it "should not be valid without a title" do
		paper = build :paper
		paper.title = ""
	
		expect(paper).to_not be_valid
	  end
end
