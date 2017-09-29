class Brand < ActiveRecord::Base
  has_many :trackers
  has_many :stores, through: :trackers
end
