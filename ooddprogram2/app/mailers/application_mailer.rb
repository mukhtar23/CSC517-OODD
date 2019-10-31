class ApplicationMailer < ActionMailer::Base
  default from: 'hwu16@ncsu.edu'
  layout 'mailer'

  def email_notify(user)
    @user = user
    mail(to: @user.email, subject: 'You have a reply for your house inquiry')
  end
end
