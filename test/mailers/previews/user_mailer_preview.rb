# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/signup_confirmation
  def signup_confirmation
    UserMailer.signup_confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_grade
  def new_grade
    UserMailer.new_grade
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/edit_grade
  def edit_grade
    UserMailer.edit_grade
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_task
  def new_task
    UserMailer.new_task
  end

end
