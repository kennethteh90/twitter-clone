require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #index' do

    let!(:tag) { create(:tag) }

    before { get :index }

    it { expect(assigns(:tags).count).to eq(1) }

  end

  

end
