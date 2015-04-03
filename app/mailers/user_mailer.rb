class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.visit_happened.subject
  #
  def visit_happened(name)
    @greeting = "Greetings!"
    @name = name
     mail to: "suzanmeryam@gmail.com", subject: "test_email"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @greeting = "Greetings!"

    mail to: "to@example.org"
  end



end
