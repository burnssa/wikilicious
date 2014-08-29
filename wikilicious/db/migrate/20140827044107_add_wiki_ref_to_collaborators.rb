class AddWikiRefToCollaborators < ActiveRecord::Migration
  def change
    add_reference :collaborators, :wiki, index: true
  end
end
