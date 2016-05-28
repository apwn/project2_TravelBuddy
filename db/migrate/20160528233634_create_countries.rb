class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.belongs_to :user, index: true
      t.string :country
      t.timestamps null: false
    end
  end
end
