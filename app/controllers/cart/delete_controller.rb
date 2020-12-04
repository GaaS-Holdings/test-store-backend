# frozen_string_literal: true

module Cart
  class DeleteController < BaseController
    def create
      if existing_item
        new_cart = current_cart.reject do |item|
          item['product_id'].to_i == product_id
        end

        write_cart(new_cart)

        render json: new_cart
      else
        render json: current_cart
      end
    end
  end
end