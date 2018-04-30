class Api::V1::Foods::FoodsController < ApplicationController
  before_action :set_food, :nil_food?, only: [:show]

  def index
    render json: Food.all
  end

  def show
    render json: Food.find(params[:id])
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
end
