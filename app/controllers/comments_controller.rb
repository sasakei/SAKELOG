class BookmarksController < ApplicationController
  before_action :set_micropost, only: %i[create destroy]

  def create
    if logged_in?
      @comment = current_user.comment.build(
                                      content: params[:content],
                                      micropost_id: params[:id],
                                      user_id: current_user.id,
                                      )
      @comment.save
    else
      flash.now[:danger] = "ログインしてください"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

end
