# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'gossips/index.html.erb', type: :view do
  before(:each) do
    @user = FactoryBot.create(:user)
    @gossip = FactoryBot.create(:gossip)
    byebug
  end

  context 'it says The Gossip Project répertorie tous les potins de THP' do
    it "displays 'The Gossip Project répertorie tous les potins de THP'" do
      # génére la page
      render

      # le contenu "Bievenue" doit être dans la page
      expect(rendered).to have_content 'The Gossip Project répertorie tous les potins de THP'
    end
  end
end
