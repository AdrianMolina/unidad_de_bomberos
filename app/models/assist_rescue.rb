class AssistRescue < ActiveRecord::Base
  belongs_to :user, inverse_of: :assist_rescues
  belongs_to :rescue, inverse_of: :assist_rescues
  validates :user, :presence => true
  validates :rescue, :presence => true
end
