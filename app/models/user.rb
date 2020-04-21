class User < ApplicationRecord

  before_save { email.downcase! }

  # ーーーvalidation_for_nameーーー
  validates :name, presence: true, length: { maximum: 10 }

  # ーーーvalidation_for_emailーーー
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  #　ーーーvalidation_for_passwordーーー
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
  has_secure_password
  validates :password,presence: true ,
            format: { with: VALID_PASSWORD_REGEX }

   # 渡された文字列のハッシュ値を返す
 def User.digest(string)
   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                 BCrypt::Engine.cost
   BCrypt::Password.create(string, cost: cost)
 end



end
