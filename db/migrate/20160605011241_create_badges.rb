class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.belongs_to :user, index: true
      t.boolean :stay_at_home, default: false
      t.boolean :day_tripper, default: false
      t.boolean :explorer, default: false
      t.boolean :itinerant, default: false
      t.boolean :frequent_flyer, default: false
      t.boolean :world_nomad, default: false
      t.boolean :bird_of_passage, default: false
      t.boolean :travel_hero, default: false
      t.boolean :nature_lover, default: false
      t.boolean :eskimo, default: false
      t.boolean :leprechaun, default: false
      t.timestamps null: false
    end
  end
end
