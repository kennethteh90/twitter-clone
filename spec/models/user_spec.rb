require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:active_relationships).dependent(:destroy) }
  it { is_expected.to have_many(:passive_relationships).dependent(:destroy) }
  it { is_expected.to have_many(:following).through(:active_relationships).source(:followed) }
  it { is_expected.to have_many(:followers).through(:passive_relationships).source(:follower) }

end
