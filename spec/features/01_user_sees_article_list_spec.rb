require "spec_helper"

# As a slacker
# I want to be able to visit a page that shows me all the submitted articles
# So that I can slack off

# When I visit /articles I should be able to see all the articles that have been submitted.
# Each article should show the description, title, and URL.
# If I click on the URL it should take me to the relevant page inside of a new tab.


feature "user sees article list" do
  scenario "user views all article list items" do
    CSV.open("articles.csv", "a", headers: true) do |csv|
      title = "How to Spot a Binicorn"
      url = "http://www.google.com"
      description = "Such a great article"
      csv.puts([title, url, description])
    end

    visit "/articles"

    expect(page).to have_content("How to Spot a Binicorn")
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("Such a great article")
  end
end
