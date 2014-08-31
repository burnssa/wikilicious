class AddPublicWikiColumnToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :public_wiki, :boolean
  end
end
