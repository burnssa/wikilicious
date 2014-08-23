class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.integer :user_id
      t.integer :colaborator_id
      t.string :description
      t.text :body

      t.timestamps
    end

    add_index :users, :id, unique: true
    add_index :collaborators, :id, unique: true
    add_index, :wikis, :id, unique: true
    add_index, :wikis, :user_id
    add_index, :wikis, :collaborator_id
  end
end
