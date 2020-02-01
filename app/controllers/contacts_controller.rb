class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_path(@contact)      
    end
  end

  def contact_params
    params.require(:contact).permit(:name,:mail,:body)
  end

  def show
    @contact = Contact.find(params[:id])
  end
end
