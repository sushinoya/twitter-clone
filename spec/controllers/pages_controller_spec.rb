require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #home'do

    before { get :home }

    it { expect(assigns(:user)).to eq(user) }

  end

end
