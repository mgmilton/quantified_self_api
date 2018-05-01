class Api::V1::Foods::FoodsController < ApplicationController
  before_action :set_food, :nil_food?, only: [:show]
  before_action :set_food, only: [:update]

  def index
    render json: Food.all
  end

  def show
    render json: Food.find(params[:id])
  end

  def create
    @food = Food.create(name: params[:food][:name], calories: params[:food][:calories])
    food_saved?
  end

  def update
    @food.update(name: params[:food][:name], calories: params[:food][:calories])
    food_saved?
  end

  private

    def set_food
      @food = Food.find_by(id: params[:id])
    end

    def nil_food?
      if @food.nil?
        render :json => {:error => "not-found"}.to_json, :status => 404
      else
        render json: @food
      end
    end

    def food_saved?
      if @food.save
        render json: @food
      else
        render :json => {:error => "missing required fields"}.to_json, :status => 400
      end
    end
end
