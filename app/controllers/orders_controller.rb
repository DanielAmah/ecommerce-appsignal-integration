# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    Appsignal.instrument('orders.index') do
      Appsignal::Logger.new('orders#index').info('Fetching all orders')

      ## uncomment this line to see the N+1 performance issue
      # @orders = Order.all

      orders = Order.all.includes(:user, line_items: :product)

      ## uncomment this block of code to trigger an error

      # if @orders.size > 100
      #   Appsignal::Logger.new('orders#index').error("Too many orders: #{@orders.size}")
      #   # raise "Too many orders"
      # end

      render json: orders.as_json(
        include: {
          user: {
            only: %i[id name email],
          },
          line_items: {
            include: {
              product: { only: %i[id name price] },
            },
            only: %i[id quantity price],
          },
        },
      )
    end
  rescue StandardError => e
    Appsignal.set_error(e)
    Appsignal::Logger.new('orders#index').error("An error occurred: #{e.message}")
    render json: { error: e.message }, status: :internal_server_error
    raise e
  end
end
