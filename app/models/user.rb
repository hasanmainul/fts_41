class User < ActiveRecord::Base
  has_many :exams, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def check_create_time
    users = User.all
    users.each do |u|
      flag = true
      u.exams.each do |exam|
        if exam.updated_at.to_date == Time.now.to_date
          flag = false
        end
      end
      if flag
        UserMailer.reminder_create_exam_user(u)
      end
    end
  end
end
