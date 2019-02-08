# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  before(:each) do
    @city = FactoryBot.create(:city)
  end

  it 'has a valid factory' do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:city)).to be_valid
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@city).to be_a(City)
    end
    describe '#first_name' do
      it { expect(@city).to validate_presence_of(:name) }
    end
  end

  context 'associations' do
    it 'should have_many gossips' do
      expect(FactoryBot.create(:city)).to have_many(:users)
    end
  end
end
