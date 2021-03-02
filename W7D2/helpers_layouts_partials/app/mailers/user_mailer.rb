class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email(user)
        @user = user
        @url = "http://localhost:3000/users/new"
        mail(to: " #{user.name} <#{user.email}>",
            subject: "Welcome to 99 Cats!!"
        )
    end
end
