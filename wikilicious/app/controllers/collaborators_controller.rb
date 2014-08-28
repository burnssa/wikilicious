class CollaboratorsController < ApplicationController
	before_action :set_wiki

  def index
  	@users = User.all
  end

  def create
  	@collaborator = @wiki.collaborators.build(user_id: params[:user_id])
  	#@collaborator = Collaborator.new(wiki_id: params[:wiki_id], user_id: params[:user_id])

  	if @collaborator.save
      flash[:notice] = "#{@collaborator.name} was added as a collaborator."
    else
      flash[:error] = "There was a error adding #{@collaborator.name} as a collaborator. Please try again."
  	end

  	redirect_to wiki_collaborators_path(@wiki)
  end

  def destroy
  	@collaborator = Collaborator.find(params[:id])
  	if @collaborator.destroy
      flash[:notice] = "You've successfully removed #{@collaborator.name} as a collaborator"
    else
      flash[:error] = "There was a error removing #{@collaborator.name} as a collaborator. Please try again."
    end
    redirect_to wiki_collaborators_path
  end

  private 

  def set_wiki
  	@wiki = Wiki.friendly.find(params[:wiki_id])
  end
end
