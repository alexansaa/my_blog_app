require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { user_id: 1 }
      expect(response).to be_successful
    end

    it 'renders the index view' do
      get :index, params: { user_id: 1 }
      assert 'title', 'Here is a list of posts for User Id: 1'
    end

    it 'renders the correct placeholder text' do
      get :index, params: { user_id: 1 }
      assert 'h1', text: 'Here is a list of posts for User Id: 1'
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { user_id: 1, id: 3 }
      expect(response).to be_successful
    end

    it 'reders the show view' do
      get :show, params: { user_id: 1, id: 3 }
      expect(response).to render_template('show')
      assert 'title', 'Here is a full description of post 3 for User ID: 1'
    end

    it 'renders the correct placeholder text' do
      get :show, params: { user_id: 1, id: 3 }
      expect(response).to render_template('show')
      assert 'h1', 'Here is a full description of post 3 for User ID: 1'
    end
  end
end
