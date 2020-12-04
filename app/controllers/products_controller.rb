# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    render json: Product.all
  end
end