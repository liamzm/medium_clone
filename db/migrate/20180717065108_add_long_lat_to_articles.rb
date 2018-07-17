class AddLongLatToArticles < ActiveRecord::Migration[5.2]
  def change

  	add_column :articles, :longitude, :float
  	add_column :articles, :latitude, :float
  end
end
