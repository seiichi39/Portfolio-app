class Reservation < ApplicationRecord
  belongs_to :court

  validates :reservation_date, presence: true
end
