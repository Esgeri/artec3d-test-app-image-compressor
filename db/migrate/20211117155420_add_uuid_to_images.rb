class AddUuidToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :uuid, :string
  end
end
