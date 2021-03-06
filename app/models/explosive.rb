class Explosive < ActiveRecord::Base
  belongs_to :emergency
  has_many :assists, :dependent => :destroy, inverse_of: :explosive
  has_many :explosive_material_useds, :dependent => :destroy, inverse_of: :explosive
  has_many :affected_people, :dependent => :destroy, inverse_of: :explosive
  has_many :institutions, :dependent => :destroy, inverse_of: :explosive
  #validates :lugar_incidente, :format => { :with => /[a-zA-Z]+/i, :message => "Sólo se permiten letras" }
  validates :lugar_incidente, :presence => true
  accepts_nested_attributes_for :assists, :allow_destroy => true
  accepts_nested_attributes_for :explosive_material_useds, :allow_destroy => true
  accepts_nested_attributes_for :affected_people, :allow_destroy => true
  accepts_nested_attributes_for :institutions, :allow_destroy => true
end
