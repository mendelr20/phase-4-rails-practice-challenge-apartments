class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def create
        lease =  Lease.create(lease_parmas)
        if lease.valid?
            render json: lease, status: :created
        else 
            render json: {error: ["Lease was not created"]}, status: :unprocessable_entity
        end
    end

    def destroy
        lease = Lease.find(params[:id]).destroy
        render json: lease, status: :accepted
    end

    private

    def render_not_found_response
        render json: { error: 'Lease not found' }, status: :not_found
    end

    def lease_parmas
        params.permit(:rent, :tenant_id, :apartment_id)
    end

end


