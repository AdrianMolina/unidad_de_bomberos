class User < ActiveRecord::Base
  has_many :emergencies
  has_many :drivers, inverse_of: :user
  has_many :assists, inverse_of: :user
  has_many :assist_rescues, inverse_of: :user
  has_many :assist_fires, inverse_of: :user
  has_many :assist_pre_hospitals, inverse_of: :user
  validates :nombre, :apellido, :format => { :with => /[a-zA-Z]+/i, :message => "Sólo se permiten letras" }
  validates :egreso, :telefono, :numericality => { :only_integer => true, :message => "Sólo se admiten numeros" }, :allow_blank => true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nombre_completo
  	"#{nombre} #{apellido}"
  end
end
