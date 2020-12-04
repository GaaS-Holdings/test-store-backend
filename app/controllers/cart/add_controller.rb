# frozen_string_literal: true

module Cart
  class AddController < BaseController
    def create
      new_cart =
        if existing_item
          current_cart.map do |item|
            if item['product_id'].to_i == product_id
              { product_id: product_id, quantity: quantity }
            else
              item
            end
          end
        else
          current_cart | [{ product_id: product_id, quantity: quantity }]
        end


      write_cart(new_cart)

      render json: new_cart
    end

    private

    def quantity
      @_quantity ||= existing_item ? existing_item['quantity'].to_i + params[:quantity].to_i : params[:quantity].to_i
    end
  end
end