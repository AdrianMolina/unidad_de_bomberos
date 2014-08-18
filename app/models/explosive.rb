class Explosive < ActiveRecord::Base
  belongs_to :emergency
  has_many :assists, :dependent => :destroy, inverse_of: :explosive
  accepts_nested_attributes_for :assists, :allow_destroy => true
end
