class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @user = User.find_by(email: login_params[:email])
    
    if @user.authenticate(login_params[:password])
      @token = encode({id: @user.id})
      p @user
      render json: {
        user: @user.attributes.except("password_digest"), include: [:alliances, :businesses],
        token: @token
      }, status: :ok
    else
      render json: {errors: 'unauthorized'}, status: :unauthorized
    end
  end

  def verify
    render json: @current_user.attributes.except("password_digest"), status: :ok
  end


  private

  def login_params
    params.require(:authentication).permit(:email, :password)
  end

end

