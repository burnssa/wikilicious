class AddCollaboratorRefToWikis < ActiveRecord::Migration
  def change
    add_reference :wikis, :collaborator, index: true
  end
end
