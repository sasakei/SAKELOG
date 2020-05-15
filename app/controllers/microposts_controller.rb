class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: [:destroy, :edit]

  def index
    @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
  end

  def new
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
    @user = User.find_by(id: @micropost.user_id)
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿が完了しました"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'new'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to current_user
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update!(micropost_params)
      flash[:success] = "投稿を更新しました"
      redirect_to @micropost
    else
      render 'edit'
    end
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :title, :image, :rate, :taste, :flavor)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
