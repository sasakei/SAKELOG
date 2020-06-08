class CommentsController < ApplicationController
  before_action :redirect_login , only: %i[create destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'コメントが投稿されました'
    else
      flash[:danger] = 'コメントできません'
    end
    redirect_to @comment.micropost
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user?(@comment.user)
      @comment.destroy
    else
      flash[:danger] = '削除できません'
    end
    redirect_to @comment.micropost
  end

  private

    def redirect_login
      flash[:danger] = "ログインしてください"
      redirect_to login_path if !logged_in?
    end

    def comment_params
      params.require(:comment).permit(:content).merge(micropost_id: params[:micropost_id])
    end
end
