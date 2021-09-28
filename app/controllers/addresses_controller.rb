class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :update]
  before_action :set_address_destroy, only: [:destroy]

  # GET /addresses
  def index
    contact_id = params["address"]["contact_id"].to_i
    @addresses = Address.where contact_id: contact_id
    render json: @addresses
  end

  # GET /addresses/1
  def show
    render json: @address
  end

  # POST /addresses
  def create
    @address = Address.new(address_params)

    if @address.save
      render json: @address, status: :created, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      render json: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.each do |address|
      address.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    def set_address_destroy
      contact_id = params["address"]["contact_id"].to_i
      if contact_id != 0
        @address = Address.where contact_id: contact_id
      else 
        @address = Address.where id: params[:id]
      end
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:cep, :road, :number, :district, :city, :states, :contact_id)
    end
end
