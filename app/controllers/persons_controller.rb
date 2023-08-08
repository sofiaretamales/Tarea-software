class PersonsController < ApplicationController
    
    def index
        @persons = Person.all
        render json: @persons
    end

    def create
        @person = Person.new(person_params)
        if @person.save
            render json: @person
        else
            render json: @person.errors, status: :unprocessable_entity
        end
    end

    def show
        @person = Person.find(params[:id])
        render json: @person
    end

    def destroy_all
        @persons = Person.all
        @persons.destroy_all
        render json: @persons
    end
    
    private
        def person_params
            params.require(:person).permit(:name)
    end

end
