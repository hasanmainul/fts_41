class UserMailer < ApplicationMailer
  def reminder_create_exam_user user
    @user = user
    mail to: user.email, subject: t "create_exam_reminder"
  end
end
