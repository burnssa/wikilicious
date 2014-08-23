class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.references :user, index: true
      t.string :name
      t.string :email
      t.boolean :wiki_access

      t.timestamps
    end
  end
end
