class EmailUser < ActiveJob::Base
    include SuckerPunch::Job
    
    def perform(scenario)
        NewComment.send_email(scenario)
    end
end 