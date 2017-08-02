class StaticpagesController < ApplicationController
  def show
    render template: "staticpages/#{params[:page]}"
  end
end
