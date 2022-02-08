class ApplicationController < ActionController::Base
    before_action :set_show_menu

    def redirect_to_login_if_necessary
        unless session['logged'] === true
            redirect_to "/login/login"
        end
    end

    def set_show_menu
        @show_menu = true
    end
end