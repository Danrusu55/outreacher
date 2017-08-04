class Target < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  has_many :entrys
end
