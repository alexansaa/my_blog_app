require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index view' do
      get :index
      assert 'title', 'Here is a list of users, as the main page'
    end

    it 'renders the correct placeholder text' do
      get :index
      assert 'h1', text: 'Here is a list of users, as the main page'
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: 1 }
      expect(response).to be_successful
    end

    it 'renders the show view' do
      get :show, params: { id: 1 }
      expect(response).to render_template('show')
      assert 'title', 'Here is most of the information for User ID: 1'
    end

    it 'renders the correct placeholder text' do
      get :show, params: { id: 1 }
      expect(response).to render_template('show')
      assert 'h1', text: 'Here is most of the information for User ID: 1'
    end
  end
end
