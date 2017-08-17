require "spec_helper"
require "rails_helper"

describe "hoem page" do
  subject {rendered}
  before do
    render
  end
  it do
    is_expected.to have_selector "h1", text: "Help"
  end
end
