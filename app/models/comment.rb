class Comment < ActiveRecord::Base

    belongs_to :user
    belongs_to :scenario
    validates :text, presence: true
    validates :user_id, presence: true
    validates :scenario_id, presence: true
end