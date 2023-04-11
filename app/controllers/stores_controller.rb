class StoresController < ApplicationController
    before_action :set_store, only: [:show, :edit, :update]
    before_action :check_login
    authorize_resource
    def index
        @active_stores = Store.active.alphabetical
        @inactive_stores = Store.inactive.alphabetical
    end

    def show
        @current_employees = @store.employees.active
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.new(store_params)
        if @store.save
            flash[:notice] = "Successfully added #{@store.name} as a store."
            redirect_to store_path(@store)
        else 
            render action: 'new'
        end
    end

    def edit 
    end


    def update
        if @store.update(store_params)
            flash[:notice] = "Updated store information for #{@store.name}."
            redirect_to @store
        else
            render action: 'edit'
        end
    end

    private
        def set_store
            @store = Store.find(params[:id])
        end
        def store_params
            params.require(:store).permit(:name, :street, :city, :state, :zip, :phone, :active)
        end
end
