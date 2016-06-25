class NewComment < ActionMailer::Base
    default from: "savon40@gmail.com"
    
    def send_email (scenario)
        mail(:to =>scenario.user.email, :subject => 'A Comment has been created on your Scenario: ' +  scenario.description)
    end 
end