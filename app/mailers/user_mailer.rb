class UserMailer < ActionMailer::Base
  def registration_confirmation(user)  
    mail(:to => user.email, :subject => "Witamy!", :from => "Sklep-Rails.pl")  
  end  
end
