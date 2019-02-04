# frozen_string_literal: true

class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  # GET return an HTML form for creating a new photo
  def new; end

  # POST create a new photo
  def create
    my_user = User.create(first_name: params['first_name'],
                          last_name: params['last_name'],
                          email: params['email'],
                          age: params['age'],
                          user_name: params['user_name'])
    Gossip.create(author: my_user,
                  title: params['title'],
                  text: params['text'])
  end

  # GET display a specific photo
  def show
    offset = Gossip.first.id
    @gossip = Gossip.find((offset + :id.to_s.to_i).to_s)
    @gossips = Gossip.all
    @id = :id.to_s
    @comments = @gossip.commentaries
  end

  # GET return an HTML form for editing a photo
  def update
    @gossip = Gossip.find(:id.to_s)
    @id = id.to_s
  end

  # PATCH/PUT update a specific photo
  def edit
    gossip = Gossip.find(:id.to_s)
    gossip.title = params['title']
    gossip.text = params['text']
  end

  # DELETE delete a specific photo
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
