require 'rails_helper'

RSpec.describe User, type: :model do

  subject { build(:user) }

  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { is_expected.to validate_uniqueness_of(:username).ignoring_case_sensitivity }

end
