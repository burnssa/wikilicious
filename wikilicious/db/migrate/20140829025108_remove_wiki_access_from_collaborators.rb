class RemoveWikiAccessFromCollaborators < ActiveRecord::Migration
  def change
  	remove_column  :collaborators, :wiki_access
    remove_column  :collaborators, :email
    remove_column  :collaborators, :name
  end
end
