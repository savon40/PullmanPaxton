class User < ActiveRecord::Base

    has_many :scenarios
    has_many :comments
    
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 1, maximum: 25}

end