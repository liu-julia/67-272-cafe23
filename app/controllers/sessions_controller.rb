class SessionsController < ApplicationController
    def new
        # rendering the view with the a blank login form
    end
    def create
        emp = Employee.authenticate(params[:username], params[:password])
        if emp.nil? || !emp
            flash.now.alert = "Username and/or password is invalid"
            render "new"
        else
            session[:employee_id] = emp.id
            redirect_to home_path, notice: "Logged in!"
        end
    end
    def destroy
        session[:employee_id] = nil
        redirect_to home_path, notice: "Logged out!"
    end
end
