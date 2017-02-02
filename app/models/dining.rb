class Dining < ApplicationRecord
  belongs_to :member
  belongs_to :reservation
end
