require 'rails_helper'

describe "Show paper index page", type: :feature do
  it "should exist at 'authors_path' and render withour an error" do
    visit papers_path
  end

  it "should show papers written in year specified in url parameters" do
    paper1 = create :paper
    paper2 = create :paper2
    expect(paper1.title).to_not eq(paper2.title)
    expect(paper1.year).to_not eq(paper2.year)
    visit papers_path
    expect(page).to have_text(paper1.title)
    expect(page).to have_text(paper2.title)

    visit papers_path + "?year=" + paper1.year.to_s
    expect(page).to have_text(paper1.title)
    expect(page).to_not have_text(paper2.title)
  end

  it "should already contain information about a specific existing author" do
    create :author
    visit authors_path

    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
  end

  it "should have a link to the page to create new authors on" do
    visit authors_path
    expect(page).to have_link "New", href: new_author_path
  end

  it "should have a link to the page of each existing author" do
    author = create :author
    visit authors_path

    expect(page).to have_link nil, href: author_path(author.id)
  end

  it "should have link to edit  author" do
    author = create :author
    visit authors_path

    expect(page).to have_link nil, href: edit_author_path(author.id)
  end

  it "should have link for each author to delete author" do
    author = create :author
    visit authors_path
    click_on("Delete")

	
    author2 = Author.where(id: author.id).take
    expect(author2).to be_nil
  end
end