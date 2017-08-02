require "rails_helper"
RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title" do
    before do
      allow(helper).to receive(:t).with(".basetitle") {"Ruby on Rails Tutorial Sample App"}
    end

    it do 
      expect(helper.full_title).to eq("Ruby on Rails Tutorial Sample App")
      expect(helper.full_title "Home").to eq("Home | Ruby on Rails Tutorial Sample App")
    end
  end
end
