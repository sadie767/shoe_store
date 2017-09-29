class Store < ActiveRecord::Base
  has_many :trackers
  has_many :brands, through: :trackers

  def letter
    array = self.store.split
    array.each do |t|
      t.capitalize!
    end
    self.store = array.join(' ')
  end
end
