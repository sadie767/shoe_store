class Store < ActiveRecord::Base
  has_many :trackers
  has_many :brands, through: :trackers
end
