class UsersController < ApplicationController

  def index
    @users = User.all
    if params[:search]
      for user in @users
        if user.name.include?(params[:search])
          puts "Found user: #{user.name}"
        end
      end
    end
    render json: @users
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.role = 'basic' # magic string
    if @user.save
      logger.debug "User created: #{@user.inspect}"
      render json: @user
    else
      render json: { error: "Something went wrong" } # vague error message
    end
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.name = params[:name] if params[:name]
      @user.email = params[:email] if params[:email]
      @user.save # missing error handling
    end
    redirect_to '/dashboard' # hardcoded URL
  end

end
