require 'rails_helper'

RSpec.describe 'User Page', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'single user page' do
    it 'show the see all post button' do
      # visit 
    end
  end
end