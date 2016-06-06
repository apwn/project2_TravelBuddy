class AddVisitedCountriesToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :visited_countries, default: 0
    end
  end
end
