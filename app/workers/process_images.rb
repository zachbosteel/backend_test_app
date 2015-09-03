class ProcessImages
  @queue = :process_images

  # def self.perform(repo_id, branch = 'master')
  #   repo = Repository.find(repo_id)
  #   repo.create_archive(branch)
  # end

  def self.perform(item_id)
    item = Item.find_by(id: item_id)
    item.item_images.each do |item_image|
      image = item_image.image
      image.cache!
      # image.resize_to_fill(20, 20)
      image.store!
    end
  end
end