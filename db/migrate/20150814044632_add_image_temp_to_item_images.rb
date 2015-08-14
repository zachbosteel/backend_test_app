class AddImageTempToItemImages < ActiveRecord::Migration
  def change
    add_column :item_images, :image_tmp, :string
  end
end
