require 'rails_helper'

RSpec.describe StatusUpdateController, type: :controller do

  let(:user) { create(:user) }

  before { sign_in user }

  describe 'PUT/PATCH #update' do

    before { put :update, user: params }

    context 'when user status updates successfully' do

      let(:params) do
        { status: 'status' }
      end

      it { expect(response).to redirect_to(root_path) }
      it { is_expected.to set_flash[:success] }

    end

    context 'when user status updates unsuccessfully' do

      let(:params) do
        { status: 'this string is 33 characters long'}
      end

      it { expect(response).to redirect_to(root_path) }
      it { is_expected.to set_flash[:error] }

    end

  end

end
