class CommentariesController < ApplicationController
  def new
		@gossip = Gossip.find(params[:format])
  end

  def create
		@gossip = Gossip.find(params[:format])
		@commentary = Commentary.create(author: current_user, text: commentary_params[:text], gossip: @gossip)
		redirect_to gossip_path(@gossip)
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def show
  end

  def index
  end

private

	def commentary_params
		params.permit(:text)
	end	
end
