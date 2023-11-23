require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { user_id: @user.id }
      expect(response).to be_successful
    end

    it 'renders the index view' do
      get :index, params: { user_id: @user.id }
      expect(response).to render_template('index')
      assert 'title', "Here is a list of posts for User Id: #{@user.id}"
    end

    it 'renders the correct placeholder text' do
      get :index, params: { user_id: @user.id }
      assert 'h1', text: "Here is a list of posts for User Id: #{@user.id}"
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { user_id: @user.id, id: @post.id }
      expect(response).to be_successful
    end

    it 'reders the show view' do
      get :show, params: { user_id: @user.id, id: @post.id }
      expect(response).to render_template('show')
      assert 'title', "Here is a full description of post #{@post.id} for User ID: #{@user.id}"
    end

    it 'renders the correct placeholder text' do
      get :show, params: { user_id: @user.id, id: @post.id }
      expect(response).to render_template('show')
      assert 'h1', "Here is a full description of post #{@post.id} for User ID: #{@user.id}"
    end
  end
end
