class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'コメントが投稿されました'
      redirect_to @comment.micropost
    else
      flash[:danger] = 'コメントできません'
      redirect_to @comment.micropost
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
  end

    private
    def comment_params
      params.require(:comment).permit(:content).merge(micropost_id: params[:micropost_id])
    end

end
