class User < ApplicationRecord
  has_one :teacher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
