class ImagesController < ApplicationController
  def index
    render json:Image.all
  end

  def show
    render json:Image.find(params['id'])
  end

  def create
    folder = Folder.find(params['folder_id'])
    if image = folder.images.create({
      focal_length: params['focal_length'],
      image_url: params['image_url'],
      time_taken: params['time_taken'],
      name: params['name']
    })
      render json:image
    else
      render json:{error: 'invalid parameters'}
    end
  end

  def update
    image = Image.find(params['id'])
    update_hash = {}
    columns = ['folder_id', 'focal_length', 'image_url', 'time_taken', 'name']
    columns.each do |column_name|
      if params[column_name]
        update_hash[column_name] = params[column_name]
      end
    end
    if image.update(update_hash)
      render json:image
    else
      render json:{error: 'invalid parameter'}
    end
  end

  def destroy
    image = Image.find(params['id'])
    image.delete
    render json:{image: 'deleted', id: params['id']}
  end

end
