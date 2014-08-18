class AssistExplosive < ActiveRecord::Base
  belongs_to :user, inverse_of: :assist_explosives
  belongs_to :explosive, inverse_of: :assist_explosives
end
