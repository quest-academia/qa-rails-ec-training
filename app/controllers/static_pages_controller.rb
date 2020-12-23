class StaticPagesController < ApplicationController
  def home
    @login_flag = true
  end

  def purchase_completed
  end
end
