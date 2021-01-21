class StaticPagesController < ApplicationController
  def home
  end

  def purchase_completed
    @last_order_id = sprintf("%04d", Order.where(user_id: 1).last.id)
  end
end
