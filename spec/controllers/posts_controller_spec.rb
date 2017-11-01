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

end
