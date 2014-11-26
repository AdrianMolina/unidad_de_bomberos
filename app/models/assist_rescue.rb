class AssistRescue < ActiveRecord::Base
  belongs_to :user, inverse_of: :assist_rescues
  belongs_to :rescue, inverse_of: :assist_rescues
  validates :user, :presence => { :message => "Se debe seleccionar un bombero de la lista" }
  validates :rescue, :presence => true
end
