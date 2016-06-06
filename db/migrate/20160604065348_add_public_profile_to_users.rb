class AddPublicProfileToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :public_profile, default: true
      t.integer :badges_count, default: 0
    end
  end
end
