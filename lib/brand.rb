class Brand < ActiveRecord::Base
  has_many :trackers
  has_many :stores, through: :trackers

  def letter
    array = self.brand.split
    array.each do |t|
      t.capitalize!
    end
    self.brand = array.join(' ')
  end
end
