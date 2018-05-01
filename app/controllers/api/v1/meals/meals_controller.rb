class Api::V1::Meals::MealsController < ApplicationController
  before_action :set_meal, only: [:show]
  def index
    render json: Meal.all
  end

  def show
    nil_meal?
  end

  private
    def set_meal
      @meal = Meal.find_by(id: params[:id])
    end

    def nil_meal?
      if @meal.nil?
        render :json => {:error => "not-found"}.to_json, :status => 404
      else
        render json: @meal
      end
    end
end
