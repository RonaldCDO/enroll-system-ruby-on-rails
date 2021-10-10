class Api::V1::LanguagesController < ApplicationController

    def index
        languages = Language.all
        render json: languages, status: :ok
    end

    def create
        language = Language.new(languages_params)
        language.save!
        render json: language, status: 201
    rescue StandardError
        head(:unprocessable_entity)
    end

    def delete
        language = Language.find(params[:id])
        language.destroy!
        render json: language, status: :ok        
    rescue StandardError
        head(:bad_request) 
    
    end    

    private

    def languages_params
        params.required(:language).permit(
            :name,
            teacher_id
        )
    end

end
