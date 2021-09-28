require 'date'

class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update]
  before_action :set_contact_destroy, only: [:destroy]

  # GET /contacts
  def index
    v = "#{params["contact"]["q"]}"
    # LIKE %q%
    @contacts = Contact.where("name LIKE ?", "%#{v}%")
    # DATA DIA/MÊS/ANO
    @contacts.each { |item| item.dateOfBirth = date_output(item.dateOfBirth) }
    render json: @contacts
  end

  # GET /contacts/1
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)
    # DATA ANO/MÊS/DIA
    @contact.dateOfBirth = date_input(@contact.dateOfBirth)
    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.each do |contact|
      contact.destroy
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end
    
    def set_contact_destroy
      @contact = Contact.where id: params[:id]
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :cpf, :email, :dateOfBirth)
    end
    
    def date_input(valor)
      tdate = DateTime.parse(valor)
      tdate.strftime("%Y/%m/%d")
    end

    def date_output(valor)
      tdate = DateTime.parse(valor)
      tdate.strftime("%d/%m/%Y")
    end
end
