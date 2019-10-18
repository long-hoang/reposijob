class Job < ApplicationRecord
  has_one :claim
  belongs_to :user
  has_many :messages
end
