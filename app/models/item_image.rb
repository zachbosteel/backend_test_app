class ItemImage < ActiveRecord::Base

  belongs_to :item
  
  validates :image, presence: true

  mount_uploader :image, ItemImageUploader
  # store_in_background :image
  process_in_background :image
end
