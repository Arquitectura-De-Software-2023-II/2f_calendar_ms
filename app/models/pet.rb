class Pet < ApplicationRecord
    has_many :days
    belongs_to :client
end