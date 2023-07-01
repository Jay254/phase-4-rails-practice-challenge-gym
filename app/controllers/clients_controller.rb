class ClientsController < ApplicationController
    before_action :set_client, only: [:show]
  
    def show
      if @client
        render json: @client, status: :ok
      else
        render json: { error: 'Client not found' }, status: :not_found
      end
    end
  
    private
  
    def set_client
      @client = Client.find_by(id: params[:id])
    end
end