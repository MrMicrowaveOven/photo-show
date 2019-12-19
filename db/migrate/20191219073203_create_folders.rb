class CreateFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :folders do |t|
      t.integer :client_id
      t.integer :parent_id
      t.string :name
      t.datetime :time_taken
      t.string :address
      t.string :contact_info
      t.integer :display_image_id

      t.timestamps
    end
  end
end
