class DirectMail < ActionMailer::Base
  def mail_to(emails, mass_mail)
    recipients emails
    from "livinhaba@gmail.com"
    subject mass_mail.subject
    body mass_mail.body
  end
end
