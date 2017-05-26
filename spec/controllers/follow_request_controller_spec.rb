require 'rails_helper'

RSpec.describe My::FollowRequestsController, type: :controller do

  let(:follow_request) { create(:follow_request) }
  let(:sender_user) { create(:user) }
  let(:recipient_user) { create(:user) }
  let(:status) { 'pending' }

  before { sign_in sender_user }


  describe 'GET #new' do

    before { get :new, controller: 'my/follow_requests', action: 'new' }

    context 'when user is successfully able to get the follow request page' do

      it { expect(response).to render_template(:new) }

    end

  end


  describe 'POST #create' do

    before { post :create, sender_id: sender_user.id, recipient_id: recipient_user.id }

    context 'when user is successfully able to create a follow request' do

      it { expect(response).to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:success] }

    end

    context 'when user is not able to create a follow request' do

      let(:recipient_user) { sender_user }

      it { expect(response).to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:error] }

    end

  end

  describe 'PUT #accept' do

    before { put :reject, sender_id: sender_user.id, recipient_id: recipient_user.id, id: follow_request.id }

    context 'when user is successfully able to accept a follow request' do

      it { is_expected.to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:success] }

    end

  end

  describe 'PUT #reject' do

    before { put :reject, sender_id: sender_user.id, recipient_id: recipient_user.id, id: follow_request.id }

    context 'when user is successfully able to reject a follow request' do

      it { expect(response).to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:success] }

    end

  end

  describe 'DELETE #destroy' do

    before { delete :destroy, sender_id: sender_user.id, recipient_id: recipient_user.id, id: follow_request.id }

    context 'when user is successfully able to disallow a follow request' do

      it { expect(response).to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:success] }

    end

  end

end
