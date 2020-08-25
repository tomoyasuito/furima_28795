class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
   validates_format_of :email, with: EMAIL_REGEX
 
   PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{6}+\z/
   validates_format_of :password, length: { minimum: 6 }, with: PASSWORD_REGEX

  with_options presence: true do
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :date
    validates :nickname
  end
end

 


