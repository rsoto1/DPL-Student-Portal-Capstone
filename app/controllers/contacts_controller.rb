class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      redirect_to root_path,
                  notice: 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name,
                                    :email,
                                    :message,
                                    :nickname)
  end
end
