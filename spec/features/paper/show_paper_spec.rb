require 'rails_helper'

describe "Show paper page", type: :feature do
  it "should exist at 'paper_path(:id)' and render without an error" do
    paper = create :paper
    visit paper_path(paper.id)
  end
end