class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :update]
  before_action :set_address_destroy, only: [:destroy]

  # GET /addresses
  def index
    contact_id = params["address"]["contact_id"].to_i
    admin_id = params["address"]["admin_id"].to_i
    @addresses = Address.where contact_id: contact_id, admin_id: admin_id 
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
    @address.destroy
    render json: @address
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    def set_address_destroy
      admin_id = params["address"]["admin_id"].to_i
      contact_id = params["address"]["contact_id"].to_i
      if admin_id != 0
        @address = Address.where admin_id: admin_id
        # @contacts = Contact.where("name LIKE ?", "%#{v}%")
      elsif contact_id != 0
        @address = Address.where contact_id: contact_id
      else 
        @address = Address.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:cep, :road, :number, :district, :city, :states, :contact_id, :admin_id)
    end
end
