class ItemImagesController < ApplicationController
  # def create
  #   @item_image = ItemImage.new(item_image_params)
  #   @item_image.save
  # end
  
  def form
    @item = Item.new
    @item_image = ItemImage.new
  end

  def create
    item = Item.new
    item.name = params[:title]
    item.description = params[:description]
    item.save
    if params[:image].present?
          params[:image].each do |item_image|
            p item_image
            new_item_image = ItemImage.create(image: item_image)
            new_item_image.item_id = item.id
            new_item_image.save
          end
    end
    p item
    Resque.enqueue(ProcessImages, item.id)
    redirect_to '/resque'
  end

  private

    def item_params
      params.require(:item).permit(:image, :item_id, :crop_x, :crop_y, :crop_z, :crop_w)
    end
end
