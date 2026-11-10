class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_owner, only: %i[edit update destroy]

  def index
    @users = User.order(:employee_number)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to @user, notice: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "削除しました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def require_owner
    redirect_to root_path, alert: "権限がありません" unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:employee_number, :password, :password_confirmation)
  end
end
