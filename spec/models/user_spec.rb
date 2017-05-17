require 'rails_helper'

RSpec.describe User, type: :model do

    subject { FactoryGirl.build(:user) }

    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }

end
