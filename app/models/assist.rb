class Assist < ActiveRecord::Base
  belongs_to :user, inverse_of: :assists
  belongs_to :explosive, inverse_of: :assists
end
