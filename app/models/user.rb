class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :token_authenticatable

  has_many :authentication_tokens
  has_many :activities

  validates :email, uniqueness: true
  validates :email, presence: true
end
