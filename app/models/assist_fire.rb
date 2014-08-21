class AssistFire < ActiveRecord::Base
  belongs_to :user, inverse_of: :assist_fires
  belongs_to :fire, inverse_of: :assist_fires
end
