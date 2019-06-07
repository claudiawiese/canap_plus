require 'rails_helper'

RSpec.describe User, type: :model do
  context 'factory test' do
    it 'has a valid factory' do
      user = create(:user)
      expect(user).to be_valid
    end
  end

  context 'relationship tests' do
    it { is_expected.to have_many(:reservations) }
    it { is_expected.to have_many(:events) }
  end

  context 'validation tests' do
    it { should validate_presence_of(:nickname) }

    it { should validate_presence_of(:team) }

    it { should validate_presence_of(:password) }

    it 'should save successfully if all information present' do
      user = create(:user)
      expect(user.save).to eq(true)
    end

    it 'does not allow duplicate nicknames' do
      build(:user, nickname: 'user1')
      build(:user, nickname: 'user1').should_not be_valid
    end

    it 'is invalid without nickname' do
      build(:user, nickname: nil).should_not be_valid
    end

    it 'is invalid without team' do
      build(:user, team: nil).should_not be_valid
    end

    it 'is invalid without password' do
      build(:user, password: nil).should_not be_valid
    end
  end
end
