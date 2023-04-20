class HomeController < ApplicationController
    def index
        if current_user && current_user.employee_role?
            @upcoming_shifts = Shift.for_employee(current_user).upcoming.chronological.paginate(page: params[:page]).per_page(10)
            @past_shifts = Shift.for_employee(current_user).past.chronological.paginate(page: params[:page]).per_page(10)
        end
    end
  
    def about
    end
  
    def contact
    end
  
    def privacy
    end
end
