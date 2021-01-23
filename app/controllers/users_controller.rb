class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "新規作成に成功しました。"
      redirect_to @user
    else
      flash.now[:danger] = "正しい値を入力してください。"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "更新に成功しました。"
      redirect_to @user
    else
      flash.now[:danger] = "正しい値を入力してください。"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    binding.pry
    redirect_to :root
  end

  private

    def user_params
      params.require(:user).permit(
        :last_name, :first_name, :zipcode, :prefecture, :municipality, :address,
        :apartments, :email, :phone_number, :company_name, :password, :password_confirmation
      )
    end

end
