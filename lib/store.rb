class Store < ActiveRecord::Base
  has_many :trackers
  has_many :brands, through: :trackers
  validates(:store, {:presence => true, :length => {:maximum => 100}})
  validates_uniqueness_of :store
  before_save(:store, :first_letter)


  def first_letter
    array = self.store.split
    array.each do |t|
      t.capitalize!
    end
    self.store = array.join(' ')
  end
end
