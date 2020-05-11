class PagesController < ApplicationController

  def index
    @feed_items = Micropost.all.paginate(page: params[:page], per_page: 10)
  end

  def about
  end
end
