require 'rails_helper'

RSpec.describe FollowRequest, type: model do

    subject { build(:follow_request) }

    it { is_expected.to validate_presence_of (:sender_id) }
    it { is_expected.to validate_presence_of (:recipient_id)}
    it { is_expected.to validate_presence_of (:status)}

end
