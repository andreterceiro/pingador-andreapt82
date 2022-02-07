class UserMailer < ApplicationMailer
    default from: "andreapt82@gmail.com"
    layout 'mailer'

    def call
        mail(to: "andreapt82@gmail.com", subject: 'Host down')
    end
end
