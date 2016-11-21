class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string   :name
      t.string   :cuisine
      t.string   :address
      t.string   :city
      t.string   :state
      t.string   :zip_code
      t.integer  :user_id

      t.timestamps
    end
  end
end
