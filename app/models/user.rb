class User < ActiveRecord::Base

    has_many :scenarios
    has_many :comments
    
    validates :username, presence: true, length: {minimum: 1, maximum: 300}
    validates_uniqueness_of :username
end