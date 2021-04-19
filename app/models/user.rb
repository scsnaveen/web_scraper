class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
         PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x
  validates :password,presence: true,length: { in: Devise.password_length },format: { with: PASSWORD_FORMAT },confirmation: true
  validates :first_name, presence: true,format: { with: /\A[a-zA-Z]+\z/,message: "Please enter valid first name" }
  validates :last_name,presence: true,format: { with: /\A[a-zA-Z]+\z/,message: "Please enter valid last name" }
  validates :user_name,presence: true
  validates :phone_number,numericality: { only_integer: true },presence: true,length: { minimum:6,maximum:10  }
  has_many :posts

   
end
