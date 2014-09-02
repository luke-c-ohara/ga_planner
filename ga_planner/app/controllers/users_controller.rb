class UsersController < ApplicationController
    
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user.create(params[:user])
      @user.save
      redirect_to users_path
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.update_attributes(params[:user])
      redirect_to(@user)
    end 

    def show
      @user = User.find(params[:id])
    end 

    def destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to users_path :notice => "Successfully destroyed user."
    end 

  end