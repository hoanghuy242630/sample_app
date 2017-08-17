require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it {is_expected.to have_http_status :success}
    it {is_expected.to render_template :new}
  end

  describe "POST #create" do
    subject {response}
    before do
      post :create, params: {session: { email: "", password: "" }}
    end

    it {is_expected.to render_template :new}
    it {expect(subject.body).to have_selector "div", class: "alert alert-danger"}
  end
end
