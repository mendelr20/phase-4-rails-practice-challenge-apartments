class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Apartment.all
    end

    
    def create
        apartment = Apartment.create(apartment_parmas)
        if apartment.valid?
            render json: apartment, status: :created
        else 
            render json: {error: ["Apartment was not created"]}, status: :unprocessable_entity
        end
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update(apartment_parmas)
        render json: apartment, status: :accepted
    end

    def destroy
       apartment = Apartment.find(params[:id]).destroy
       render json: apartment, status: :accepted
    end

    private

    def render_not_found_response
        render json: { error: 'Apartment not found' }, status: :not_found
    end

    def apartment_parmas
        params.permit(:number)
    end

end
