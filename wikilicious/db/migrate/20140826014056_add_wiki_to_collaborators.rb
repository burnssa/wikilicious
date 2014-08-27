class AddWikiToCollaborators < ActiveRecord::Migration
  def change
    add_reference :collaborators, :wiki, index: true
    remove_column :wikis, :name
    remove_column :wikis, :email
    remove_column :wikis, :wiki_access
  end
end
