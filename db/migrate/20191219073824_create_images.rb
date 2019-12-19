class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :folder_id
      t.string :focal_length
      t.string :image_url
      t.datetime :time_taken
      t.string :name

      t.timestamps
    end
  end
end
