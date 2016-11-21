class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer  :rating
      t.string   :review
      t.integer  :user_id
      t.integer  :restaurant_id

      t.timestamps
    end
  end
end
