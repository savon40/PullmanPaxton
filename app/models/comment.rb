class Comment < ActiveRecord::Base

    belongs_to :user
    belongs_to :scenario
    validates :text, presence: true

end