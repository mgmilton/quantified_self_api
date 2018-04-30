class Api::V1::Foods::FoodsController < ApplicationController

  def index
    render json: Food.all
  end


end
