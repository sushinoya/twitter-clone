require 'rails_helper'

RSpec.describe FollowRequest, type: :model do

    subject { build(:follow_request) }

    it { is_expected.to validate_presence_of(:sender) }
    it { is_expected.to validate_presence_of(:recipient) }
    it { is_expected.to validate_presence_of(:status) }

    context 'When recipient is the sender' do
      let(:user) { create(:user) }
      subject { build(:follow_request, sender: user, recipient: user) }

      before { subject.valid? }
      it { expect(subject.errors.messages[:sender]).to include('You cannot send a follow request to yourself! Gosh! Get a life man.')  }
    end

    it { is_expected.to validate_uniqueness_of(:sender).scoped_to(:recipient_id) }
    it { is_expected.to define_enum_for(:status).with([:pending, :accepted, :rejected]) }
end
