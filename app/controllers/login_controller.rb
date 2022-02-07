class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token

  def logout
    session["logged"] = false
    redirect_to "/login/login"
  end

  def login
    @mostrar_menu = false
    unless params['login'].nil?
      @usuario = Usuario.find_by_login params['login']
      
      unless @usuario.nil?
        if @usuario.password == Digest::MD5.hexdigest(params['password'] + Usuario.get_salt) and @usuario.active == 1
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