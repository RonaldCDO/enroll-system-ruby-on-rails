class Api::V1::TeachersController < ApplicationController
    def index
        teachers = Teacher.all
        render json: teachers, status: :ok
    end

    def show
        teacher = Teacher.find(params[:id])
        render json: teacher, status: :ok
    rescue
        head(:not_found)
    end

    def create
        teacher = Teacher.new(teacher_params)
        teacher.save!
        render json: teacher, status: 201
    rescue StandardError
        head(:unprocessable_entity)
    end

    def update
        teacher = Teacher.find(params[:id])
        teacher.update!(teacher_params)
        render json: teacher, status: :ok
    rescue StandardError
        head(:unprocessable_entity)
    end


    def delete
        teacher = Teacher.find(params[:id])
        teacher.destroy!
        render json: teacher, status: :ok        
    rescue StandardError
        head(:bad_request) 
    end

    private

    def teacher_params
        params.required(:teacher).permit(
            :name,
            :email,
            :born_date
        )
    end

end
