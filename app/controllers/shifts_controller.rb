class ShiftsController < ApplicationController
    before_action :set_shift, only: [:show, :edit, :update, :destroy]
    #before_action :check_login
    #authorize_resource
    def index
        if current_user && current_user.employee_role?
            @upcoming_shifts = Shift.for_employee(current_user).upcoming.chronological.paginate(page: params[:page]).per_page(10)
            @past_shifts = Shift.for_employee(current_user).past.chronological.paginate(page: params[:page]).per_page(10)
        elsif current_user && current_user.admin_role?
            @upcoming_shifts = Shift.upcoming.chronological.paginate(page: params[:page]).per_page(10)
            @past_shifts = Shift.past.chronological.paginate(page: params[:page]).per_page(10)
        elsif current_user && current_user.manager_role?
            @upcoming_shifts = Shift.for_store(current_user.current_assignment.store).upcoming.chronological.paginate(page: params[:page]).per_page(10)
            @past_shifts = Shift.for_store(current_user.current_assignment.store).past.chronological.paginate(page: params[:page]).per_page(10)
        end
    end
    
    def show
    end

    def new
        @shift = Shift.new()
    end
    
    def create
        @shift = Shift.new(shift_params)
        if @shift.save
            flash[:notice] = "Successfully added shift"
            redirect_to @shift
        else 
            render action: 'new'
        end
    end

    def edit
    end
    
    def update
        if @shift.update(shift_params)
            flash[:notice] = "Updated Shift."
            redirect_to @shift
        else
            render action: 'edit'
        end
    end
    def destroy
        if @shift.destroy
            flash[:notice] = "Deleted future shift"
            redirect_to shifts_path
        else
            render action: 'show'
        end
    end
    
    def tc
        if current_user.role == "employee"
            if !current_user.shifts.for_next_days(0).empty?
                @shift_today = current_user.shifts.chronological.upcoming.first
            else
                #flash [:notice] = "You do not have any shifts today"
                redirect_to home_path, notice: "You do not have any shifts today"
            end
        end
    end
    def clock_in
        if current_user.role == "employee"
            if !current_user.shifts.for_next_days(0).empty?
                tc = TimeClock.new(current_user.shifts.chronological.upcoming.first)
                tc.start_shift_at(Time.now)
                redirect_to home_path, notice: "Your shift has started."
            else
                redirect_to home_path, notice: "You do not have any shifts today"
            end
        end
    end

    def clock_out
        if current_user.role == "employee"
            if !current_user.shifts.for_next_days(0).empty?
                tc2 = TimeClock.new(current_user.shifts.chronological.upcoming.first)
                tc2.end_shift_at(Time.now)
                redirect_to home_path, notice: "Your shift has ended."
            else
                redirect_to home_path, notice: "You do not have any shifts today"
            end
        end
    end

    private
        def set_shift
            @shift = Shift.find(params[:id])
        end
        def shift_params
            params.require(:shift).permit(:assignment_id, :date, :start_time, :end_time, :notes, :status)
        end
end
