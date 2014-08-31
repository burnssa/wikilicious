class WikisController < ApplicationController
  def index
    @wikis = current_user.wikis  
    @collaboration_wikis = current_user.collaborators.collect(&:wiki)
    #@public_wikis = Wiki.where(public_wiki: true)
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Your wiki has been created."
    else
      flash[:error] = "There was an error saving your wiki. Please try again."
    end 
    redirect_to wikis_path
  end

  def edit
    wiki = Wiki.friendly.find(params[:id])
    @wiki = wiki if current_user.can_collaborate_on?(wiki)
  end

  def update
    wiki = Wiki.friendly.find(params[:id])
    @wiki = wiki if current_user.can_collaborate_on?(wiki)

    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "wiki was saved"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again"
      render :edit
    end
  end

  def show
    wiki = Wiki.friendly.find(params[:id])
    @wiki = wiki if current_user.can_collaborate_on?(wiki)
  end 

  def destroy
    @wiki = current_user.wikis.friendly.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "The \"#{@wiki.description}\" wiki was deleted successfully"
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the wiki. Please try again."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:description, :body)
  end
end
