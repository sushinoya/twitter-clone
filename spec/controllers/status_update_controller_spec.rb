require 'rails_helper'

RSpec.describe My::StatusUpdateController, type: :controller do

  let(:user) { create(:user) }

  before { sign_in user }

  describe 'PUT/PATCH #update' do

    before { put :update, status_update_form: params }

    context 'when user status updates successfully' do

      let(:params) do
        { user: { status: 'status' } }
      end

      it { expect(response).to redirect_to(my_root_path) }
      it { is_expected.to set_flash[:success] }

    end

    context 'when user status updates unsuccessfully' do

      let(:params) do
        { user: { status: 'this string is  > 50 characters long and it will not work so yeah this should fail' } }
      end

      it { expect(response).to redirect_to(my_root_path) }
      it { is_expected.to set_flash[:error] }

    end

  end

end
