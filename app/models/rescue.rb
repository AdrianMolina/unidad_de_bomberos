class Rescue < ActiveRecord::Base
  belongs_to :emergency
  has_many :assist_rescues, :dependent => :destroy, inverse_of: :rescue
  accepts_nested_attributes_for :assist_rescues, :allow_destroy => true
end
