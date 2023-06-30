module Api # same name as folder in services
  module Links # same name as file in folder above
    def self.delete_link(params)
      link = Link.find_by(id: params[:id])

      return ServiceContract.error("Link not found") unless link

      if link.destroy
        ServiceContract.success(link)
      else
        ServiceContract.error("Failed to delete link")
      end
    end

    def self.new_link(params)
      link = Link.new(link: params[:link], link_name: params[:link_name], notes_id: params[:notes_id])
      begin
        link.save! #link is valid
      rescue
        return ServiceContract.error("Error") unless link.valid?
      end

      ServiceContract.success(link)
    end

    def self.update_link(params)
      link = Link.find_by(id: params[:id])

      return ServiceContract.error("Link not found") unless link

      if link.update(link: params[:link], link_name: params[:link_name])
        ServiceContract.success(link)
      else
        ServiceContract.error("Failed to update link")
      end
    end
  end
end
