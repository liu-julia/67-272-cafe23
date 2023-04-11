class ShiftJobsController < ApplicationController
    before_action :set_shift_job, only: [:destroy]
    before_action :check_login
    authorize_resource
    def new
        @shift_job = ShiftJob.new
    end

    def create
        @shift_job = ShiftJob.new(shift_job_params)
        if @shift_job.save
            flash[:notice] = "Successfully added shift job"
            redirect_to @shift_job.shift
        else 
            render action: 'new'
        end
    end

    def destroy
        @shift_job.destroy
        flash[:notice] = "Successfully removed record"
        redirect_to @shift_job.shift
    end
    private
        def set_shift_job
            @shift_job = ShiftJob.find(params[:id])
        end
        def shift_job_params
            params.require(:shift_job).permit(:shift_id, :job_id)
        end
end
