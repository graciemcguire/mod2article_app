class UsersController < ApplicationController
  skip_before_action :check_login, only: [:login, :authenticate]

  def new
    @user = User.new
  end

  def show
    find_user
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to "/home"
    else
      render :new
    end
  end

  def home
  # byebug
    @category_1_articles = get_top_headlines(current_user.category1)
    @category_2_articles = get_top_headlines(current_user.category2)
    @category_3_articles = get_top_headlines(current_user.category3)
    @articles = [@category_1_articles, @category_2_articles, @category_3_articles].flatten
  end

  def login
    @user = User.new
  end

  def authenticate
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to "/home"
    else
      @user = User.new
      render :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:username, :password, :name, :category1, :category2, :category3)
  end
end
