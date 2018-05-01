class Api::V1::Meals::MealsController < ApplicationController
  before_action :set_meal, only: [:show]
  def index
    render json: Meal.all
  end

  def show
    nil_meal?
  end

  def create
    food_storer
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

    def food_storer
      @food = Food.find_by(id: params[:id])
      @meal = Meal.find_by(id: params[:meal_id])
      if @meal.nil? || @food.nil?
        render :json => {:error => "not-found"}.to_json, :status => 404
      else
        @meal.mealfoods.create(food_id: @food.id)
        render :json => {:message => "Successfully added #{@food.name} to #{@meal.name}"}.to_json, :status => 201
      end
    end
end
