class PagesController < ApplicationController
  def index
    @micropost = current_user.microposts.build if logged_in?
  end
end
