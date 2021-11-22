require 'rails_helper'

describe "Show authors index page", type: :feature do
  it "should exist at 'edit_author_path(author.id)' and render without an error" do
    author = create :author
    visit edit_author_path(author.id)
  end
  it "should show existing info of database objects" do
    author = create :author
    visit edit_author_path(author.id)

    expect(page).to have_field('author[first_name]', with: 'Alan')
    expect(page).to have_field('author[last_name]', with: 'Turing')
    expect(page).to have_field('author[homepage]', with: 'http://wikipedia.de/Alan_Turing')
  end
  it "should save the changed input to db on submit" do
    author = create :author
    visit edit_author_path(author.id)

    fill_in "author[first_name]", with: "Bob"
    find('input[type="submit"]').click

    author2 = Author.where(id: author.id).take
    expect(author2.first_name).to eq("Bob")
  end

end

