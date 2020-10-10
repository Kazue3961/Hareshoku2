class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :member_id
      t.integer :event_id
      t.date :date
      t.string :food
      t.text :content
      t.string :food_image_id

      t.timestamps
    end
  end
end
