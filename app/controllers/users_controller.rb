class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
      # log_in @user
      flash[:success] = "新規作成に成功しました。"
      redirect_to @user
    else
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(
        :last_name, :first_name, :zipcode, :prefecture, :municipality, :address,
        :apartments, :email, :phone_number, :company_name, :password, :password_confirmation
      )
    end
end
