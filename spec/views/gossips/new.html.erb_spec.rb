# frozen_string_literal: true

require 'rails_helper'

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'gossips/new.html.erb', type: :view do
  before(:each) do
    @test_gossip = FactoryBot.create(:gossip)
  end

  context 'it says Create a new potin !' do
    it "displays 'Create a new potin !'" do
      # génére la page
      render

      # le contenu "Bievenue" doit être dans la page
      expect(rendered).to have_content 'Create a new potin !'
    end
  end

  # context "it says 'En voilà un bon potin!' when the Gossip created is valid" do
  #   it "displays 'welcome'" do
  #     # dit à la view que @user sera le build d'un utilisateur avec "lol@email.com" comme email
  #     @gossip = FactoryBot.create(:gossip)

  #     # génère la vue (ceci doit être fait après avoir assigné la variable d'instance, pour qu'il puisse la trouver)
  #     render

  #     # la vue rendered doit afficher l'email passé
  #     expect(rendered).to have_content "En voilà un bon potin!"
  #   end
  # end

  # context "it says 'Raté!' when the Gossip created is invalid" do
  #   it "displays 'welcome'" do

  #     @gossip = FactoryBot.create(:gossip_skips_validate, title: '')
  #     @gossip.valid? #compulsory otherwiser errors aren't generated.

  #     # génère la vue (ceci doit être fait après avoir assigné la variable d'instance, pour qu'il puisse la trouver)
  #     render

  #     # la vue rendered doit afficher l'email passé
  #     expect(rendered).to have_content "Raté!"
  #   end
  # end
end
