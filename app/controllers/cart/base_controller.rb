# frozen_string_literal: true

module Cart
  class BaseController < ApplicationController
    skip_before_action :verify_authenticity_token

    before_action :check_product

    private

    def check_product
      Rails.logger.debug(params.inspect)

      head :not_found unless Product.find_by(id: product_id)
    end

    def existing_item
      current_cart.find do |item|
        item['product_id'].to_i == product_id
      end
    end

    def product_id
      @_product_id ||= params[:product_id].to_i
    end

    def current_cart
      @_current_cart ||= cookies[:cart] ? JSON.parse(cookies[:cart]).deep_dup : []
    end

    def write_cart(cart)
      cookies[:cart] = { value: cart.to_json, same_site: :none, secure: true }
    end
  end
end