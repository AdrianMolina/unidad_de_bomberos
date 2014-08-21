class Fire < ActiveRecord::Base
  belongs_to :emergency
  has_many :assist_fires, :dependent => :destroy, inverse_of: :fire
  accepts_nested_attributes_for :assist_fires, :allow_destroy => true 
end
