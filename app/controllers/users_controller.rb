class UsersController < ApplicationController

  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    #@books = @user.books.page(params[:page])
    @books = @user.books
    @new = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "sucuccessfully"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end

end
