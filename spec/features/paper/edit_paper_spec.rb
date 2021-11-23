require 'rails_helper'

describe "Show authors page", type: :feature do
  it "should allow adding a second author" do
    paper = create :paper

    expect(paper.authors.size).to eq(1)
    author = create :author2
    visit edit_paper_path(paper.id)
    select = page.find('select')
    select.select author.name

    find('input[type="submit"]').click
    paper = Paper.where(id: paper.id).take
    expect(paper.authors.size).to eq(2)
    expect(paper.authors[1].name).to eq('Peter Plagiarist')
  end

end

