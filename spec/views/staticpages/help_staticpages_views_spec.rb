require "spec_helper"
require "rails_helper"
 
describe "staticpages/help.html.erb" do
  subject {rendered}
  before do
    render
  end
  it do
    is_expected.to have_selector "h1", text: "Help"
  end
end
