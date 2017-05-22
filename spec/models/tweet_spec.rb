require 'rails_helper'

RSpec.describe Tweet, type: :model do

  subject { build(:tweet) }

  it { is_expected.to validate_presence_of(:user_id).ignoring_case_sensitivity }
  it { is_expected.to validate_presence_of(:message).ignoring_case_sensitivity }

end
