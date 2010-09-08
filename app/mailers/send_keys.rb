class SendKeys < ActionMailer::Base
  default :from => "ryan.spicer@asu.edu"
  
  def key_notification(recipient)
    @voter = recipient
    
    mail(:to => recipient.email,
             :subject => "Your AMESA Election Registration")
    
  end
end
