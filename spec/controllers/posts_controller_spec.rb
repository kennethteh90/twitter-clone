require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do

    before { get :index }

    it { expect(assigns(:post)).to be_a(Post) }
    # how to test feed items?
    it { expect(assigns(:tag)).to be_a(Tag) }

  end

  describe 'DELETE #destroy' do

    let!(:post) { create(:post, user: user) }

    before { delete :destroy, params: { id: post } }

    it { expect(assigns(:post)).to be_destroyed }
    it { is_expected.to set_flash[:deleted] }
    it { is_expected.to redirect_to(profile_users_all_index_path) }

  end

end
