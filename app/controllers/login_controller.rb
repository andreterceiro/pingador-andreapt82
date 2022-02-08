class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token

  def logout
    session["logged"] = false
    redirect_to "/login/login"
  end

  def login
    @show_menu = false
    unless params['login'].nil?
      @user = User.find_by_login(params['login'])

      unless @user.nil?
        if @user.password == Digest::MD5.hexdigest(params['password'] + User.get_salt) and @user.active == "1"
          session['logged'] = true
          redirect_to "/hosts"
        else
          @error = "Invalid credentials"
        end
      else
        @error = "Invalid credentials"
      end
    end
  end
end