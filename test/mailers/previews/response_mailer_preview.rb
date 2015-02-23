# Preview all emails at http://localhost:3000/rails/mailers/response_mailer
class ResponseMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/response_mailer/send_response
  def send_response
    ResponseMailer.send_response
  end

end
