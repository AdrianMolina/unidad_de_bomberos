class Fire < ActiveRecord::Base
  belongs_to :emergency
  has_many :assist_fires, :dependent => :destroy, inverse_of: :fire
  has_many :fire_material_useds, :dependent => :destroy, inverse_of: :fire
  has_many :fire_affected_people, :dependent => :destroy, inverse_of: :fire
  has_many :fire_institutions, :dependent => :destroy, inverse_of: :fire
  validates :lugar_incidente, :format => { :with => /[a-zA-Z]+/i, :message => "Sólo se permiten letras" }
  accepts_nested_attributes_for :assist_fires, :allow_destroy => true
  accepts_nested_attributes_for :fire_material_useds, :allow_destroy => true
  accepts_nested_attributes_for :fire_affected_people, :allow_destroy => true
  accepts_nested_attributes_for :fire_institutions, :allow_destroy => true
end
