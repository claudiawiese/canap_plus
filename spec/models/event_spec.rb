require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'factory test' do
    it 'has a valid factory' do
      event = create(:event)
      expect(event).to be_valid
    end
  end

  context 'relationship tests' do
  end
end
