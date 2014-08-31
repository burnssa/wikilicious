class AddPublicWikiColumnToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :public_wiki, :boolean, default: :true
  end
end
