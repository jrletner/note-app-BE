module Api # same name as folder in services
  module Images # same name as file in folder above
    def self.delete_image(params)
      image = Image.find_by(id: params[:id])

      return ServiceContract.error("Image not found") unless image

      if image.destroy
        ServiceContract.success(image)
      else
        ServiceContract.error("Failed to delete image")
      end
    end

    def self.new_image(params)
      image = Image.new(image_path: params[:image_path], link_name: params[:link_name], notes_id: params[:notes_id])
      begin
        image.save! #Image is valid
      rescue
        return ServiceContract.error("Error") unless image.valid?
      end

      ServiceContract.success(image)
    end

    def self.update_image(params)
      image = Image.find_by(id: params[:id])

      return ServiceContract.error("Image not found") unless image

      if image.update(image_path: params[:image_path], link_name: params[:link_name])
        ServiceContract.success(image)
      else
        ServiceContract.error("Failed to update image")
      end
    end
  end
end
