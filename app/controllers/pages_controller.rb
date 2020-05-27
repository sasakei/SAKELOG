class PagesController < ApplicationController

  def index
    @timelines = Micropost.all.paginate(page: params[:page], per_page: 10)
    @q = @timelines.ransack(params[:q])
    @feed_items = @q.result(distinct: true)
  end

  def about
  end
end
