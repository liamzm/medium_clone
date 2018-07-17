class ChangeCityToAddressInArticles < ActiveRecord::Migration[5.2]
  def change

  	rename_column :articles, :city, :address
  end
end
