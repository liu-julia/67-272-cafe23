class SessionsController < ApplicationController
    def new
        # rendering the view with the a blank login form
    end
    def create
        emp = Employee.authenticate(params[:username], params[:password])
        if emp
            session[:employee_id] = emp.id
            redirect_to home_path, notice: "Logged in!"
        else emp
            flash.now.alert = "Username and/or password is invalid"
            render "new"
        end
    end
    def destroy
        if session[:employee_id]
            session[:employee_id] = nil
            redirect_to home_path, notice: "Logged out!"
        else
            render "new"
        end
    end
end
