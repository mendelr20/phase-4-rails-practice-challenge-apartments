class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Tenant.all
    end

    
    def create
        tenant =  Tenant.create(tenant_parmas)
        if tenant.valid?
            render json: tenant, status: :created
        else 
            render json: {error: ["Tenant was not created, Please Check the tenants age"]}, status: :unprocessable_entity
        end
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update(tenant_parmas)
        render json: tenant, status: :accepted
    end

    def destroy
        tenant = Tenant.find(params[:id]).destroy
        render json: tenant, status: :accepted
    end

    private

    def render_not_found_response
        render json: { error: 'Tenant not found' }, status: :not_found
    end

    def tenant_parmas
        params.permit(:name, :age)
    end

end
