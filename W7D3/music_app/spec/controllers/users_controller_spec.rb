require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_params) { (user: {email: "theo@mantz.io", password: "password1"}  )}
  let(:invalid_params) { (user: {email: "bonehead@bh.com", password: "pas"}  )}
  let(:user) { User.find_by(email: "theo@mantz.io")}


  context 'with valid params' do
    before :each do
      post :create, params: valid_params
    end

    it 'creates the user' do
      # expect
    end

  end
end
