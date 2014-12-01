class PitchMailer < ActionMailer::Base
  def email(journalist, subject, body, user)
    @journalist_name = journalist.first_name
    @body = body
    mail(
      to: journalist.email,
      subject: subject,
      from: "#{user.full_name} <pitchfort@gmail.com>",
      reply_to: user.email
    )
  end
end
