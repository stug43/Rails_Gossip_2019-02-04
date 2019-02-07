# frozen_string_literal: true

class GossipsController < ApplicationController
before_action :authenticate_user, only: [:show, :create, :update, :destroy]

  def index
    @gossips = Gossip.order(id: :asc).all
  end
	
	def search
	end
	
	def search_post
		if Gossip.include_id?(params[:id].to_s.to_i)  
			redirect_to "/gossips/#{params[:id].to_s}"  
		else
			redirect_to "/error_404"
		end
	end

  # GET return an HTML form for creating a new potin
  def new; end

  # POST create a new photo
  def create
		@user = current_user
    gossip = Gossip.new
				gossip.author = @user
       	gossip.title =  params['title']
       	gossip.text = params['text']
				gossip.save
				redirect_to "/"
	end

  # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  def show
    @gossip = Gossip.find(params[:id].to_s)
    @gossips = Gossip.all
    @id = :id.to_s
    @comments = @gossip.commentaries
  end

  # GET return an HTML form for editing a photo
  def edit
		@gossip = Gossip.find(params[:id])
  end

  # PATCH/PUT update a specific photo
  def update
		@gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:gossip][:title], text: params[:gossip][:text])
			@gossip.save
			redirect_to "/"
		else
			redirect_to edit_gossip_path
		end
  end

  # DELETE delete a specific photo
  def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to root_path
	end
end
