class OrdersController < ApplicationController
  include OrdersHelper
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, only: [:show]

  def show
    @order = current_user.orders.find_by(id: params[:id])
  end
end
