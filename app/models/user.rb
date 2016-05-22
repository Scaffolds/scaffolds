class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_secure_password

  FULLNAME_REGEX = /\A[a-zA-Z]{3,}(\s[a-zA-Z]{3,})*\z/
  SIMPLE_EMAIL_REGEX = /\A[\w\-\d]+(\.[\w\-\d]+)?@[\w\-\d]+\.[\w\-\d]+\z/

  validates :fullname,
            presence: true,
            length: { in: (3..255) },
            format: { with: FULLNAME_REGEX }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: SIMPLE_EMAIL_REGEX }

  validates :password,
            presence: true,
            length: { minimum: 8 }
end
