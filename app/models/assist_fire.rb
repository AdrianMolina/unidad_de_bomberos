class AssistFire < ActiveRecord::Base
  belongs_to :user, inverse_of: :assist_fires
  belongs_to :fire, inverse_of: :assist_fires
  validates :fire, :presence => true
  validates :user, :presence => { :message => "Se debe seleccionar un bombero de la lista" }
end
