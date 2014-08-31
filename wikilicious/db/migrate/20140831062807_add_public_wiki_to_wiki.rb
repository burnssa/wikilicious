class AddPublicWikiToWiki < ActiveRecord::Migration
  def change
  	add_column :wikis, :public_wiki, :boolean
  	remove_column :wikis, :public
  end
end
