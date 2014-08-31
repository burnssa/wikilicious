class RemovePublicWikiFromWikis < ActiveRecord::Migration
  def change
  	remove_column :wikis, :public_wiki
  end
end
