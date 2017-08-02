require "rails_helper"

RSpec.describe StaticpagesController, type: :controller do
  describe "GET show" do
    context "go to home page" do
      before do
        get :show, params: {page: :home}
      end

      it{expect(response).to render_template(:home)}
    end

    context "go to about page" do
      before do
        get :show, params: {page: :about}
      end

      it{expect(response).to render_template(:about)}
    end

    context "go to help page" do
      before do
        get :show, params: {page: :help}
      end

      it{expect(response).to render_template(:help)}
    end
  end
end
