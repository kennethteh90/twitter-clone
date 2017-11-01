require 'rails_helper'

RSpec.describe Post, type: :model do

  it { is_expected.to have_many(:post_tags).dependent(:destroy) }
  it { is_expected.to have_many(:tags).through(:post_tags) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_length_of(:content).is_at_most(140) }
  it { is_expected.to accept_nested_attributes_for(:tags).allow_destroy(true) }

end
