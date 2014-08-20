class Institution < ActiveRecord::Base
  belongs_to :explosive, inverse_of: :institutions
end
