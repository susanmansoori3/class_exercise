class ResponseMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.response_mailer.send_response.subject
  #
  def send_response(response)
    @greeting = "Hi"
    @response = response
    mail(to: @response.invitee_email, subject: 'You\'ve been invited')
  end

  def finished(invitation)
    @greeting ="Hi"
    @invitation = invitation
    mail(to: @invitation.recipient_email, subject: 'SURPRISE! Here\'s a special greeting just for you!')
  end
end
