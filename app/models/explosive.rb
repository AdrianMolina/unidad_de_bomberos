class Explosive < ActiveRecord::Base
  belongs_to :emergency
  accepts_nested_attributes_for :assist_explosives, :allow_destroy => true
end
