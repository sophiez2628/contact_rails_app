class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def index
    if params.has_key?(:user_id)
      @contacts = Contact.where(user_id: params[:user_id])
    else
      render json: "User not specified."
    end

    render json: @contacts
  end

  def favorite
    if params.has_key?(:user_id)
      @contacts = Contact.where(user_id: params[:user_id], favorites: true)
    else
      render json: "User not specified."
    end

    render json: @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:user_id, :name, :email)
  end
end
