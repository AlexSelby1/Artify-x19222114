class Contact < MailForm::Base
    attribute :name, :validate =>true
    attribute :email, :validate => /\A[^@\s]+@[^@\s]+\z/
    attribute :message, :validate => true
    attribute :nickname, :captcha => true #spambot
     attribute :subject, :validate => true
    
    
    def headers 
        {
        :subject => :subject,
        :to => "a.selb121@gmail.com",
        :from => %("#{name}" <#{email}>)
    }
    end
end