class Room < ActiveRecord::Base
  has_many :patrimonies

  validates_uniqueness_of :locale, :identifier
end
