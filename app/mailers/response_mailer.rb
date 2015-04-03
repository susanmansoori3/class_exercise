class ResponseMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.response_mailer.send_response.subject
  #
  def send_response(response)
    @greeting = "Hey there!"
    @response = response
    mail(to: @response.invitee_email, subject: 'You\'ve been invited')
  end

  def finished(invitation)
    @greeting ="Hey there!"
    @invitation = invitation
    mail(to: @invitation.recipient_email, subject: 'SURPRISE! Here\'s a special greeting just for you!')
  end
end
