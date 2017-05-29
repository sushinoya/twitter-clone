require 'rails_helper'

RSpec.describe My::FollowRequestsController, type: :controller do

  let(:sender_user) { create(:user) }
  let(:recipient_user) { create(:user) }
  let(:follow_request) { create(:follow_request, sender: sender_user, recipient: recipient_user) }

  let(:status) { 'pending' }

  describe 'GET #new' do

    before { sign_in sender_user }
    before { get :new, controller: 'my/follow_requests', action: 'new' }

    context 'when user is successfully able to get the follow request page' do

      it { expect(response).to render_template(:new) }

    end

  end

  describe 'POST #create' do

    context 'when user is successfully able to create a follow request' do

      before { sign_in sender_user }
      before { post :create, recipient_id: create(:user).id, sender_id: sender_user.id }

      it { expect(response).to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:success] }

    end

    context 'when user is not able to create a follow request' do

      before { sign_in recipient_user }
      before { post :create, recipient_id: recipient_user.id }

      it { expect(response).to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:error] }

    end

  end

  describe 'PUT #accept' do

    context 'when user is successfully able to accept a follow request' do

      before { sign_in follow_request.recipient }
      before { put :accept, id: follow_request.id }

      it { is_expected.to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:success] }

    end

    context 'when user is not able to accept a follow request' do

      before { sign_in follow_request.sender }
      before { put :accept, id: follow_request.id }

      it { expect(response).to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:error] }

    end

  end

  describe 'PUT #reject' do


    context 'when user is successfully able to reject a follow request' do

      before { sign_in follow_request.recipient }
      before { put :reject, id: follow_request.id }

      it { expect(response).to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:success] }

    end

    context 'when user is not able to reject a follow request' do

      before { sign_in follow_request.sender }
      before { put :reject, id: follow_request.id }

      it { expect(response).to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:error] }

    end

  end

  describe 'DELETE #destroy' do


    context 'when user is successfully able to disallow a follow request' do

      before { sign_in follow_request.recipient }
      before { delete :destroy, id: follow_request.id }

      it { expect(response).to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:success] }

    end

    context 'when user is not able to destroy a follow request' do

      before { sign_in follow_request.sender }
      before { put :accept, sender_id: follow_request.sender_id, recipient_id: follow_request.recipient_id, id: follow_request.id }

      it { expect(response).to redirect_to(new_my_follow_request_path) }
      it { is_expected.to set_flash[:error] }

    end

  end

end
