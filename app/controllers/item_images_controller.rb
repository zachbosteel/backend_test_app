class ItemImagesController < ApplicationController
  def create
    @item_image = ItemImage.new(item_image_params)
    @item_image.save
  end
  
  def form
    @item_image = ItemImage.new
  end

  def create
    #if params[:image].present?
      puts params[:item_image][:image]
      item_image = ItemImage.create(image: params[:item_image][:image])
      #item_image.item_id = item.id
      item_image.save
    #end
    redirect_to '/sidekiq'
  end

  private

    def item_params
      params.require(:item).permit(:image, :item_id, :crop_x, :crop_y, :crop_z, :crop_w)
    end
end
