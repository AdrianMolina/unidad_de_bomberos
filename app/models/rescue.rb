class Rescue < ActiveRecord::Base
  belongs_to :emergency
  has_many :assist_rescues, :dependent => :destroy, inverse_of: :rescue
  has_many :rescue_material_useds, :dependent => :destroy, inverse_of: :rescue
  has_many :rescue_affected_people, :dependent => :destroy, inverse_of: :rescue
  has_many :rescue_institutions, :dependent => :destroy, inverse_of: :rescue
  validates :lugar_incidente, :format => { :with => /[a-zA-Z]+/i, :message => "Sólo se permiten letras" }
  accepts_nested_attributes_for :assist_rescues, :allow_destroy => true
  accepts_nested_attributes_for :rescue_material_useds, :allow_destroy => true 
  accepts_nested_attributes_for :rescue_affected_people, :allow_destroy => true
  accepts_nested_attributes_for :rescue_institutions, :allow_destroy => true
end
