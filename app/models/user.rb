class User < ActiveRecord::Base
  has_many :emergencies
  has_many :drivers, inverse_of: :user
  has_many :assist_rescues, inverse_of: :user
  has_many :assist_fires, inverse_of: :user
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nombre_completo
  	"#{nombre} #{apellido}"
  end
end
