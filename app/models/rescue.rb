class Rescue < ActiveRecord::Base
  belongs_to :emergency
  has_many :assist_rescues, :dependent => :destroy, inverse_of: :rescue 
  has_many :rescue_affected_people, :dependent => :destroy, inverse_of: :rescue
  accepts_nested_attributes_for :assist_rescues, :allow_destroy => true
  accepts_nested_attributes_for :rescue_affected_people, :allow_destroy => true
end
