module RailsAdminImageManager
  class ImagesController < RailsAdminImageManager::ApplicationController

    def index
      respond_to do |format|
        format.html {
          @tags   = RailsAdminImageManager::Tag.with_files
        }

        format.json {
          images  = RailsAdminImageManager::File.select(:id, :name, :image_file_name).page(params[:page])
          images  = images.filter_by_text(params[:search]) if filter_by?(:search)
          images  = images.filter_by_tags(params[:tags].split(',').map{|i| i.to_i }) if filter_by?(:tags)

          images.each do |image|
              image.src = image.image.url(:index)
          end

          data    = { items: images, total_count: images.total_count, limit_value: images.limit_value }

          render json: data, methods: [:src, :tags_list], status: :ok
        }
      end
    end

    def show
      image     = RailsAdminImageManager::File.select(:id, :name, :description, :copyright, :image_file_name).find_by!(id: params[:id])
      image.src = image.image.url(:show)

      render json: image, methods: [:src, :tags_list], status: :ok
    end

    def update
    end

    def create
    end

    def destroy
    end

  end
end
