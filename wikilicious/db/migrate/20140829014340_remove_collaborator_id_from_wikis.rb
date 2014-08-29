class RemoveCollaboratorIdFromWikis < ActiveRecord::Migration
  def change
  	remove_column :wikis, :collaborator_id
  end
end
