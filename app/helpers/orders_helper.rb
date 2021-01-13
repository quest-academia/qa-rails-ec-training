module OrdersHelper

  def cancel_button_indicate #「注文をキャンセルする」ボタンは注文状態に「準備中」のものがあれば表示

    @array = []
      @order.order_details.each do | order_detail | 
        @array = order_detail.shipment_status.shipment_status_name
      end
      
  end
end
