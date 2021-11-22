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
	
	  it "shouldn't be valid without a title" do
		paper = build :paper
		paper.title = ""
	
		expect(paper).to_not be_valid
	  end
	  it "shouldn't be valid without a venue" do
		paper = build :paper
		paper.venue = ""
	
		expect(paper).to_not be_valid
	  end
	
	  it "shouldn't be valid without a numerical year" do
		paper = build :paper
	
		paper.year = ""
		expect(paper).to_not be_valid
	
		paper.year = 2001
		expect(paper).to be_valid
	
		paper.year = 2.8
		expect(paper).to_not be_valid
	  end
end
