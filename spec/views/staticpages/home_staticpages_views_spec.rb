require "spec_helper"
require "rails_helper"
 
describe "staticpages/home.html.erb" do
  subject {rendered}
  before do
    render
  end
  it do
    is_expected.to have_selector "h1", text: "Home"
    is_expected.to have_link "Ruby on Rails Tutorial", href: "http://www.railstutorial.org/"
  end
end
