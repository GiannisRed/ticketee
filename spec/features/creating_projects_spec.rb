# There is some problem with rspec V3. But in your case you are using V2.
# change
# require 'rails_helper'
# to
# require 'spec_helper'
require "spec_helper"

feature "Users can create new projects" do
    scenario "with valid attributes" do
        visit "/"
        
        click_link "New Project"
        
        fill_in "project_name", with: "Sublime Text 3"
        fill_in "project_description", with: "A text editor for everyone"
        click_button "Create Project"
        
        expect(page).to have_content "Project has been created."
    end
end