class Scenario < ActiveRecord::Base

    belongs_to :user
    validates :description, presence: true, length: {minimum: 3, maximum: 300}
    
    validates_uniqueness_of :description
end