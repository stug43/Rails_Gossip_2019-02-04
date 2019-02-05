# frozen_string_literal: true

class GossipsController < ApplicationController
  # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  def index
    @gossips = Gossip.all
  end
	
	
def search_post
   if Gossip.include_id?(params[:id].to_s.to_i)  
     redirect_to "/gossips/#{params[:id].to_s}"
   else
     redirect_to "/error_404"
   end
 end

  def search; end


  # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  def new; end

  # POST create a new photo
  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)

    #    my_user = User.create(first_name: params['first_name'],
    #                          last_name: params['last_name'],
    #                          email: params['email'],
    #                          age: params['age'],
    #                          user_name: params['user_name'])
    #   Gossip.create(author: my_user,
    #                  title: params['title'],
    #                 text: params['text'])
    my_user = User.create(first_name: params['first_name'],
                          last_name: params['last_name'],
                          email: params['email'],
                          age: params['age'],
                          user_name: params['user_name'])
    Gossip.create(author: my_user,
                  title: params['title'],
                  text: params['text'])
  end

  # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  def show
    @gossip = Gossip.find("#{params[:id]}")
    @gossips = Gossip.all
    @id = :id.to_s
    @comments = @gossip.commentaries
  end

  # GET return an HTML form for editing a photo
  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params
  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

  def update
    @gossip = Gossip.find(:id.to_s)
    @id = id.to_s
  end

  # PATCH/PUT update a specific photo
  # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  def edit
    gossip = Gossip.find(:id.to_s)
    gossip.title = params['title']
    gossip.text = params['text']
  end

  # DELETE delete a specific photo
  # Méthode qui récupère le potin concerné et le détruit en base
  # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)

  def delete; end
end

#             Prefix Verb   URI     Pattern                                                                              Controller#Action
#                   gossips GET    /gossips(.:format)                                                                       gossips#index
#                           POST   /gossips(.:format)                                                                       gossips#create
#                new_gossip GET    /gossips/new(.:format)                                                                   gossips#new
#               edit_gossip GET    /gossips/:id/edit(.:format)                                                              gossips#edit
#                    gossip GET    /gossips/:id(.:format)                                                                   gossips#show
#                           PATCH  /gossips/:id(.:format)                                                                   gossips#update
#                           PUT    /gossips/:id(.:format)                                                                   gossips#update
#                           DELETE /gossips/:id(.:format)                                                                   gossips#destroy
#                      root GET    /                                                                                        gossips#index
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
