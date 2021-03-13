# frozen_string_litral: true

class CartController < ApplicationController
  def index
    render json: current_cart
  end

  private

  def current_cart
    @_current_cart ||= cookies[:cart] ? JSON.parse(cookies[:cart]).deep_dup : []
  end
end