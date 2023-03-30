module Api::V1
  class EmployeesController < ApiController
    # Controller code
    before_action :set_employees, only: [:show, :update, :destroy]

    def index
      @employees = Employee.active.alphabetical
      render json: EmployeeSerializer.new(@employees)
    end

    
  end
end