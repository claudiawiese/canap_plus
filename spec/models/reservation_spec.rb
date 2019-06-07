require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context 'factory test' do
    it 'has a valid factory' do
      reservation = create(:reservation)
      expect(reservation).to be_valid
    end
  end

  context 'relationship tests' do
    it { should belong_to(:event) }
    it { should belong_to(:user) }
  end
end
