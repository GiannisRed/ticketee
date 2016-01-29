# There is some problem with rspec V3. But in your case you are using V2.
# change
# require 'rails_helper'
# to
# require 'spec_helper'
require "spec_helper"

feature "Users can create new projects" do
  before do
    visit "/"

    click_link "New Project"
  end

  scenario "with valid attributes" do
    fill_in "project_name", with: "Sublime Text 3"
    fill_in "project_description", with: "A text editor for everyone"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."

    project = Project.find_by(name: "Sublime Text 3")
    expect(page.current_url).to eq project_url(project)

    title = "Sublime Text 3 - Projects - Ticketee"
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do
    click_button "Create Project"

    expect(page).to have_content "Project has not been created."
    expect(page).to have_content "Name can't be blank"
  end
end
