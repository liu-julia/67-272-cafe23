module Api::V1
  class StoresController < ApiController

    before_action :set_store, only: [:show, :update, :destroy]
    def show
      if params[:upcoming].present?
        render json: StoreUpcomingSerializer.new(Shift.for_store(@store).upcoming.by_employee)
      else
        render json: @store
      end
    end

    # private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    
  end
end