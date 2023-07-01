class MembershipsController < ApplicationController
    def create
      membership = Membership.new(membership_params)
      if membership.save
        render json: membership, status: :created
      else
        render json: { errors: membership.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      membership = Membership.find_by(id: params[:id])
      if membership
        membership.destroy
        render json: {}, status: :ok
      else
        render json: { error: 'Membership not found' }, status: :not_found
      end
    end
  
    private
  
    def membership_params
      params.permit(:gym_id, :client_id, :charge)
    end
end