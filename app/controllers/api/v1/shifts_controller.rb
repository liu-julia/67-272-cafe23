module Api::V1
  class ShiftsController < ApiController
    # controller code
    before_action :set_shift, only: [:show, :update, :destroy]

    # def index
    #   @shifts = Shift.all
    #   render json: @shifts
    # end
      def show
      render json: ShiftSerializer.new(@shift)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

  end
end