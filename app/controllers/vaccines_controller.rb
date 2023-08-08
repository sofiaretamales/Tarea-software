class VaccinesController < ApplicationController

    def index
        @person = Person.find(params[:person_id])
        render json: @person.vaccines
    end

    def create
        @person = Person.find(params[:person_id])
        @vaccine = @person.vaccines.new(vaccine_params)
        if  @vaccine.save
            render json: @person.vaccines
        else
            render json: @vaccine.errors, status: :unprocessable_entity
        end
    end

    def update
        @person = Person.find(params[:person_id])
        @vaccine = @person.vaccines.find(params[:id])
        if @vaccine.update(vaccine_params)
            render json: @person.vaccines
        else
            render json: @vaccine.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @person = Person.find(params[:person_id])
        @vaccine = @person.vaccines.find(params[:id])
        @vaccine.destroy
        render json: @person.vaccines
    end

    private
        def vaccine_params
            params.require(:vaccine).permit(:vaccine_type, :vaccine_date, :person)
    end

end
