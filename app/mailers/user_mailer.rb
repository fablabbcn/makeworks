class UserMailer < ApplicationMailer
	default from: 'MakeWorks <noreply@mg.make.works>'

  def welcome_email(user)
	  @user = user
    mail(to: user.email, subject: "Welcome to Make Works").tap do |message|
      message.mailgun_options = {
        #"tag" => ["abtest-option-a", "beta-user"],
        "tracking-opens" => true,
        "tracking-clicks" => "htmlonly"
      }
    end
  end
end
