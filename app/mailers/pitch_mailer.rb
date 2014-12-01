class PitchMailer < ActionMailer::Base

  def test_email(journalist_email, subject, body, user)
    mail(to: journalist_email,
         subject: subject,
         body: body,
         from: "Matt <pitchfort@gmail.com>",
         reply_to: user.email
        )
  end
end
