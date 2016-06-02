class CreateCountryInfos < ActiveRecord::Migration
  def change
    create_table :country_infos do |t|
      t.string :name
      t.string :countrycode
      t.string :capital
      t.string :region
      t.integer :population
      t.integer :area
      t.string :callingcode
      t.string :demonym
      t.string :currency
      t.timestamps null: false
    end
  end
end
