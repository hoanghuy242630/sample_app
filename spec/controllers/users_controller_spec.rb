require "rails_helper"

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #signup" do
    context "invalid signup" do
      let :count {0}
      before do
        post :create, params: {user: {name: "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar"}}
      end
      it {expect(User.count).to eq count}
      it {expect(response).to render_template :new}
    end

    context "signup success" do
      let :count {0}
      before do
        post :create, params: {user: {name: "huyhuy",
          email: "user@gmail.com",
          password: "foobar",
          password_confirmation: "foobar"}}
      end
      it {expect(User.count).not_to eq count}
      it {expect(response).to redirect_to user_path 1}
    end
  end
end
