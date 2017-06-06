require 'rails_helper'

RSpec.describe Tweet, type: :model do

  subject { build(:tweet) }

  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:text) }
  it { is_expected.to validate_length_of(:text).is_at_least(10).is_at_most(140) }

end
