require 'rails_helper'

describe MicropostsController do
  describe 'GET #index' do
    # it '投稿が新着順に表示されること' do
    # end

    it 'indexテンプレートをレンダリングすること' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    # it 'リクエストされたmicropostのパラメータが@micropostに割り当てられていること' do
    # end
    #
    # it 'showテンプレートをレンダリングすること' do
    # end
  end

  describe 'GET #new' do
    it 'newテンプレートをレンダリングすること' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'リクエストされたmicropostのパラメータが@micropostに割り当てられていること' do
    end

    # it 'editテンプレートをレンダリングすること' do
    # end
  end
end
