class FoldersController < ApplicationController
  def index
    render json:Folder.all
  end

  def show
    render json:Folder.find(params['id'])
  end

  def create
    client = Client.find(params['client_id'])
    if folder = client.folders.create({
      name: params['name'],
      time_taken: params['time_taken'],
      address: params['address'],
      contact_info: params['contact_info'],
      display_image_id: params['display_image_id']
    })
      render json:folder
    else
      render json:{error: 'invalid parameters'}
    end
  end

  def update
    folder = Folder.find(params['id'])
    update_hash = {}
    columns = ['client_id', 'parent_id', 'name', 'time_taken', 'address', 'contact_info', 'display_image_id']
    columns.each do |column_name|
      if params[column_name]
        update_hash[column_name] = params[column_name]
      end
    end
    if folder.update(update_hash)
      render json:folder
    else
      render json:{error: 'invalid parameter'}
    end
  end

  def destroy
    folder = Folder.find(params['id'])
    folder.delete
    render json:{folder: 'deleted', id: params['id']}
  end
end
