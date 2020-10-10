class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :season_id
      t.date :date
      t.string :name
      t.string :food
      t.text :introduction
      t.string :event_image_id

      t.timestamps
    end
  end
end
