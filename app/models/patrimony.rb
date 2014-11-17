class Patrimony < ActiveRecord::Base
  belongs_to :responsible
  belongs_to :room

  #has_one :responsible_id
  #has_one :room_id

  validates_uniqueness_of :identifier
  validates_presence_of :responsible_id, :room_id

end
