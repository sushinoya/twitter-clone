require 'rails_helper'

RSpec.describe FollowRequest, type: :model do

    subject { build(:follow_request) }

    it { is_expected.to validate_presence_of(:sender) }
    it { is_expected.to validate_presence_of(:recipient)}
    it { is_expected.to validate_presence_of(:status)}

end
