class Day < ApplicationRecord
    has_many :events
    belongs_to :pet
end