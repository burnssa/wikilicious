class RemoveNameFromCollaborators < ActiveRecord::Migration
  def change
  	remove_column :collaborators, :email
    remove_column :collaborators, :wiki_access
  end
end
