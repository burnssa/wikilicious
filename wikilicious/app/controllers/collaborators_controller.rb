class CollaboratorsController < ApplicationController
	before_action :set_wiki

  def index
  	@users = User.all
  end

  def create
  	@collaborator = @wiki.collaborators.build(user_id: params[:user_id])
  	#@collaborator = Collaborator.new(wiki_id: params[:wiki_id], user_id: params[:user_id])

  	if @collaborator.save
  	else
  	end

  	redirect_to wiki_collaborators_path(@wiki)
  end

  def destroy
  	@collaborator = Collaborator.find(params[:id])
  	# rest of normal destroy here
  end

  private 

  def set_wiki
  	@wiki = Wiki.find(params[:wiki_id])
  end
end
