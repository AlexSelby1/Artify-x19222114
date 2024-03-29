class ContactsController < ApplicationController
    
    def new
        @contact = Contact.new
    end
    
    def create
       @contact = Contact.new(params[:contact])
       @contact.request = request 
        if @contact.deliver
           flash.now[:error] = nil
           redirect_to root_path, notice: 'Message sent successfully'
        else
            flash.now[:error] = 'Message is undeliverable'
            render :new
        end
    end
end
