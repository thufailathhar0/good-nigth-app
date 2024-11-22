require 'rails_helper'

RSpec.describe Sleep, type: :model do
  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to respond_to(:clock_in) }
  it { is_expected.to respond_to(:clock_out) }

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
  end
end
