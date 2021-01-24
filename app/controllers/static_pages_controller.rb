class StaticPagesController < ApplicationController
  def home
  end

  def purchase_completed
    @last_order_id = "%04d" % current_user.orders.last.id
  end
end
