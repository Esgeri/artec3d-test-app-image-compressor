class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :email
      t.string :image_file

      t.timestamps
    end
  end
end
