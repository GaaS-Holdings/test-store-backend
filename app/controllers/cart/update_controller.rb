# frozen_string_literal: true

module Cart
  class UpdateController < AddController
    before_action :check_quantity

    private

    def check_quantity
      head :unprocessable_entity if quantity <= 0
    end

    def quantity
      @_quantity ||= params[:quantity].to_i
    end
  end
end