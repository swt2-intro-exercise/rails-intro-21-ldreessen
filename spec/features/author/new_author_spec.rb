require 'rails_helper'

describe "New author page", type: :feature do
	it "should exist at 'new_author_path' and render withour error" do
		# https://guides.rubyonrails.org/routing.html#path-and-url-helpers
		visit new_author_path
	end
	it "should have text inputs for an author's first name, last name, and homepage" do
		visit new_author_path
		# these are the standard names given to inputs by the Rails form builder
		expect(page).to have_field('author[first_name]')
		expect(page).to have_field('author[last_name]')
		expect(page).to have_field('author[homepage]')
	end
	it 'should save the author' do
		visit new_author_path
		page.fill_in('author[first_name]', with: 'Edsger')
		page.fill_in('author[last_name]', with: 'Dijkstra')
		page.fill_in('author[homepage]', with: 'https://de.wikipedia.org/wiki/Edsger_W._Dijkstra')
		find('input[type="submit"]').click
	end
	it "should not be valid without a last name" do
		author = build :author
		author.last_name = ""
	
		expect(author).to_not be_valid
	  end
	  it "should show the error text, when no last name is inserted and the user wants to submit" do
		visit new_author_path
	
		# expect to not see any errors yet
		expect(page).to_not have_text("Last name can't be blank")
	
		fill_in "author[first_name]", with: "Alan"
		fill_in "author[homepage]", with: 'http://wikipedia.org/Alan_Turing'
		find('input[type="submit"]').click
	
		# expect to not yet find the new author in the db
		author = Author.where(first_name: "Alan", homepage: "http://wikipedia.org/Alan_Turing").take
		#expect(author).to be_nil
	
	
		# expect to now see an error printed
		expect(page).to have_text("error")
	  end
end
