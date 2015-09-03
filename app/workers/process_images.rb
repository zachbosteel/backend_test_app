class ProcessImages
  @queue = :process_images

  def self.perform(item_id)
    item = Item.find_by(id: item_id)
    item.item_images.each do |item_image|
      image = item_image.image
      image.cache!
      image.store!
    end
  end
end