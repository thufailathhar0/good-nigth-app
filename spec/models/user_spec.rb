require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to respond_to(:name) }

  context 'Associations' do
    it { is_expected.to have_many(:sleeps) }
    it { is_expected.to have_many(:followed_users).with_foreign_key(:follower_id).class_name('Follow') }
    it { is_expected.to have_many(:follower_users).with_foreign_key(:followed_id).class_name('Follow') }
    it { is_expected.to have_many(:followed).through(:followed_users).source(:followed) }
    it { is_expected.to have_many(:followers).through(:follower_users).source(:follower) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
