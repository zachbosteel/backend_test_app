# encoding: utf-8

class ItemImageUploader < CarrierWave::Uploader::Base

  storage :file
  
  include CarrierWave::RMagick
  include ::CarrierWave::Backgrounder::Delay

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def auto_orient
    manipulate! do |img|
      img = img.auto_orient
    end
  end

  version :small do
    process :auto_orient
    process :resize_to_limit => [100, 100]
  end
  
  version :medium do
    process :auto_orient
    process :resize_to_limit => [320, 320]
  end

  version :large do
    process :auto_orient
    process :resize_to_limit => [550, 550]
  end

  def crop
    manipulate! do |img|
      x = 0
      y = 0
      w = img.columns
      h = img.columns
      img.crop!(x, y, w, h)
    end
  end
  
end
