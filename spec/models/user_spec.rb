# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  it 'has a valid factory' do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:user)).to be_valid
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@user).to be_a(User)
    end
    describe '#first_name' do
      it { expect(@user).to validate_presence_of(:first_name) }
    end
    describe '#last_name' do
      it { expect(@user).to validate_presence_of(:last_name) }
    end
    describe '#username' do
      it { expect(@user).to validate_length_of(:user_name).is_at_least(6) }
    end
    describe '#age' do
      it { expect(@user).to validate_numericality_of(:age) }
    end
  end

  context 'associations' do
    it 'should have_many gossips' do
      expect(FactoryBot.create(:user)).to have_many(:gossips)
    end
  end
end
