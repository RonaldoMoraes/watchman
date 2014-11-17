class Responsible < ActiveRecord::Base
  has_many :patrimonies

  validates_uniqueness_of :identifier, :email, :tel

end
