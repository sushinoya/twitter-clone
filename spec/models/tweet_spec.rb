require 'rails_helper'

RSpec.describe Tweet, type: :model do

  subject { build(:tweet) }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:text) }

end
