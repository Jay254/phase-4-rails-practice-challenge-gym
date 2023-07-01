class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :gym_id, uniqueness: { scope: :client_id, message: 'already has a membership for this gym' }
  validates :charge, numericality: true
  validates :gym_id, presence: true
  validates :client_id, presence: true
end
