class Notifier < ActionMailer::Base
  def signup_thanks(user)
    recipients  user.email
    from  "heldersj@gmail.com"
    subject  "Thanks you for registering with our website"
    body "account" => user
  end
end
