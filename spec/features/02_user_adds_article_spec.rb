require "spec_helper"

# As a slacker
# I want to be able to submit an incredibly interesting article
# So that other slackers may benefit
# Acceptance Criteria:
#
# When I visit /articles/new it has a form to submit a new article.
# The form accepts an article title, URL, and description.
# When I successfully post an article, it should be saved to a CSV file.

feature "user adds article list item" do
  scenario "item added when filled form submitted" do
    visit "/articles/new"

    fill_in "Article Title", with: "Binicorn Facts & Myths"
    fill_in "Article URL", with: "http://theadventurezone.wikia.com/wiki/Garyl"
    fill_in "Article Description", with: "What you know about binicorns may be wrong"
    click_on "Submit Article"

    expect(page.current_path).to eq "/articles"
    expect(page).to have_content("Binicorn Facts & Myths")
  end

  scenario "empty li element is not added when a field has been submitted that is blank" do
    visit "/articles/new"
    click_on "Submit Article"

    expect(page.current_path).to eq "/articles/new"
    expect(page).not_to have_selector("li")
  end
end
