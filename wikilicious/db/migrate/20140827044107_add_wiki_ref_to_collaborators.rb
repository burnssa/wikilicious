class AddWikiRefToCollaborators < ActiveRecord::Migration
  def change
    add_reference :collaborators, :wiki, index: true
    remove_column :collaborators, :name
    remove_column :collaborators, :email
    remove_column :collaborators, :wiki_access
  end
end
