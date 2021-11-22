require 'rails_helper'

author_Alan = Author.create(
            first_name:"Alan",
            last_name:"Turing",
            homepage:"http://wikipedia.org/Alan_Turing")

describe "Author page", :type => :feature do
	it "Author page should display all authors" do
        visit authors_path
        expect(page).to have_text("Alan")
        expect(page).to have_text("Turing")
    end

    it "Author page should display author details #7" do
        # Tipp im Issue: FactoryBot.create :author
        visit authors_path(@Alan)
        expect(page).to have_text("Alan")
        expect(page).to have_text("Turing")
        expect(page).to have_text("http://wikipedia.org/Alan_Turing")
    end

end 