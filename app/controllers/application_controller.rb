class ApplicationController < ActionController::Base

    def redirect_to_login_if_necessary
        unless session['logged'] === true
            redirect_to "/login/login"
        end
    end
end
