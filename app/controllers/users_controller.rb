class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show, :index]
  before_action :correct_user,   only: [:edit, :update]
  
  
  def index
    @users = User.all
  end
  
  

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @projs = @user.projs  
  end
  
  


  def create
    @user = User.new(user_params)
    @user.admin=1;
    if @user.save
      sign_in @user
      
      flash[:success] = @user.name+", Welcome to DOCAMP! You will like it"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end


  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def home
    @proj = current_user.projs.build if signed_in
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

     # Before filters

    def signed_in_user
      unless signed_in
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end