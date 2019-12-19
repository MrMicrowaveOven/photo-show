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
end
