require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject(:theo) {User.create(email: "theo@theo.com", password: "abc123" )}

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6).allow_nil }
  end

  describe '#is_password?' do
    let(:user) { FactoryBot.build(:user) }

    it 'takes in a password as an argument' do
      expect{user.is_password?("password123")}.not_to raise_error
    end

    context "with a valid password" do
      it 'should return true' do
        expect(user.is_password?("password123")).to be true
      end
    end

    context "with an invalid password" do
      it 'should return false' do
        expect(user.is_password?("abc123")).to be false
      end
    end
  end

  describe "#password=" do
    it 'does not save the password to the database' do
      FactoryBot.create(:user, email: "theo@mantz.io")

      user = User.find_by(email: "theo@mantz.io")

      expect(user.password).not_to eq("OreoCat2017")
    end

    it 'creates a password_digest using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with("abc123")

      FactoryBot.build(:user, password: "abc123")
    end
  end
end