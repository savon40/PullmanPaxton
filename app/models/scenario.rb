class Scenario < ActiveRecord::Base

    belongs_to :user
    has_many :comments
    validates :description, presence: true, length: {minimum: 3, maximum: 300}
    validates :user_id, presence: true
    validates_uniqueness_of :description
end