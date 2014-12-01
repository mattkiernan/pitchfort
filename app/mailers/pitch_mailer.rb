class PitchMailer < ActionMailer::Base

  def email(journalist_email, subject, body, user)
    mail(to: journalist_email,
         subject: subject,
         body: body,
         from: "#{user.full_name} <pitchfort@gmail.com>",
         reply_to: user.email
        )
  end
end
