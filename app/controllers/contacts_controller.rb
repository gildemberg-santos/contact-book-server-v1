class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Array.new
    v = "#{params["contact"]["q"]}".downcase
    q = Contact.order(name: :asc)
    count = 0
    for item in q do
      if item.name.downcase.include? v
        @contacts.push(item)
      end
    end
    render json: @contacts
  end

  # GET /contacts/1
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

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
    puts 'testou apagar'
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :cpf, :email, :dateOfBirth, :admin_id)
    end
end
