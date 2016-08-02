class UserMailer < ApplicationMailer
  default from: "from@example.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_grade.subject
  #
  def new_grade(user)
    @user = user
    @greeting = "Hi"

    mail to: @user.email, subject: "New grade created"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.edit_grade.subject
  #
  def edit_grade
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_task.subject
  #
  def new_task
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
