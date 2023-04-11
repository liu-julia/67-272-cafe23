class PayGradeRatesController < ApplicationController
    before_action :check_login
    authorize_resource
    def new
        @pgr = PayGradeRate.new
    end

    def create
        @pgr = PayGradeRate.new(pgr_params)
        if @pgr.save
            flash[:notice] = "Successfully added Pay Grade Rate"
            redirect_to @pgr.pay_grade
        else 
            render action: 'new'
        end
    end
    private
        def pgr_params
            params.require(:pay_grade_rate).permit(:pay_grade_id, :rate, :start_date, :end_date)
        end
end
