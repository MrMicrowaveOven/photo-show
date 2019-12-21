class ClientsController < ApplicationController
  def index
    render json:Client.all
  end

  def show
    render json:Client.find(params['id'])
  end

  def create
    c = Client.new(name: params['name'])
    if c.save
      render json:c
    else
      render json:{error: 'invalid parameter'}
    end
  end

  def update
    c = Client.find(params['id'])
    update_hash = {}
    ['name'].each do |column_name|
      if params[column_name]
        update_hash[column_name] = params[column_name]
      end
    end
    if c.update(update_hash)
      render json:c
    else
      render json:{error: 'invalid parameter'}
    end
  end

  def destroy
    c = Client.find(params['id'])
    c.delete
    render json:{client: 'deleted', id: params['id']}
  end
end
