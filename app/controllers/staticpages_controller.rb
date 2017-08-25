class StaticpagesController < ApplicationController
  def show
    render template: "staticpages/#{params[:page]}"
  end

  def home
    return unless logged_in?
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.paginate page: params[:page]
  end
end
