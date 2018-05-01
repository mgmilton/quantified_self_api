class Api::V1::Meals::MealsController < ApplicationController
  before_action :set_meal, only: [:show]
  before_action :set_food_and_meal, only: [:create, :destroy]

  def index
    render json: Meal.all
  end

  def show
    nil_meal?
  end

  def create
    food_storer
  end

  def destroy
    food_destroyer
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

    def set_food_and_meal
      @food = Food.find_by(id: params[:id])
      @meal = Meal.find_by(id: params[:meal_id])
    end

    def food_storer
      if @meal.nil? || @food.nil?
        render :json => {:error => "not-found"}.to_json, :status => 404
      else
        @meal.mealfoods.create(food_id: @food.id)
        render :json => {:message => "Successfully added #{@food.name} to #{@meal.name}"}.to_json, :status => 201
      end
    end

    def food_destroyer
      if @meal.nil? || @food.nil?
        render :json => {:error => "not-found"}.to_json, :status => 404
      else
        @meal.foods.delete(@food)
        render :json => {:message => "Successfully removed #{@food.name} from #{@meal.name}"}
      end
    end
end
