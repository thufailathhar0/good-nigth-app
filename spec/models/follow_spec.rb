require 'rails_helper'

RSpec.describe Follow, type: :model do
  it { is_expected.to respond_to(:follower_id) }
  it { is_expected.to respond_to(:followed_id) }

  context 'Associations' do
    it { is_expected.to belong_to(:follower) }
    it { is_expected.to belong_to(:followed) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:follower_id) }
    it { is_expected.to validate_presence_of(:followed_id) }
  end
end
