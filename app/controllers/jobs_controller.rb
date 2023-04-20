class JobsController < ApplicationController
    before_action :check_login
    authorize_resource
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    #before_action :check_login
    # authorize_resource
    def index
        @jobs = Job.all.paginate(page: params[:page]).per_page(10)
    end

    def new
        @job = Job.new
    end

    def create
        @job = Job.new(job_params)
        if @job.save
            flash[:notice] = "Successfully added #{@job.name} as a Job."
            redirect_to jobs_path
        else 
            render action: 'new'
        end
    end

    def edit 
    end


    def update
        if @job.update(job_params)
            flash[:notice] = "Updated job information for #{@job.name}."
            redirect_to jobs_path
        else
            render action: 'edit'
        end
    end

    def destroy
        if @job.destroy
            flash[:notice] = "Successfully removed #{@job.name}"
            redirect_to jobs_path
        else
            render action: 'index'
        end
    end

    private
        def set_job
            @job = Job.find(params[:id])
        end
        def job_params
            params.require(:job).permit(:name, :description, :active)
        end
end
