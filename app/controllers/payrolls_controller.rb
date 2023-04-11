class PayrollsController < ApplicationController
    def store_form
        if current_user.role == "employee"
            redirect_to home_path
        end
    end

    def employee_form
        if current_user.role != "admin" 
            redirect_to home_path
        end
    end

    def employee_payroll
        dr = DateRange.new(Date.parse(params[:start_date]), Date.parse(params[:end_date]))
        prc = PayrollCalculator.new(dr)
        @employee_payroll = prc.create_payroll_record_for(Employee.find(params[:employee_id]))
    end
    def store_payroll
        dr2 = DateRange.new(Date.parse(params[:start_date]), Date.parse(params[:end_date]))
        prc2 = PayrollCalculator.new(dr2)
        if current_user.role == "admin"
            @store_payroll = prc2.create_payrolls_for(Store.find(params[:store_id]))
        elsif current_user.role == "manager"
            store = current_user.current_assignment.store
            @store_payroll = prc2.create_payrolls_for(store)
        end
    end
    private
        
end
