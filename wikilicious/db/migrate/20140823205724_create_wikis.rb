class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.references :user, index: true
      t.string :description
      t.text :body

      t.timestamps
    end
  end
end
