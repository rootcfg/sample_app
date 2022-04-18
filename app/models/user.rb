class User < ApplicationRecord

    attr_accessor :remember_token

    before_save { self.email = email.downcase}

    validates :name, presence: true,     length: { minimum: 5, maximum: 100 }
    validates :email, presence: true,    length: { minimum: 5, maximum: 100 },
                                         format: { with: URI::MailTo::EMAIL_REGEXP },
                                         uniqueness: { case_sensitive: false, message: "email already present" }

    has_secure_password :password
    validates :password, presence: true, length: { minimum: 6, maximum: 30 }

    def User.digest(password)
        BCrypt::Password.create(password)
    end

    def User.new_token
      SecureRandom.urlsafe_base64
    end

    def remember
      self.remember_token = User.new_token
      self.update_attribute(:remember_digest, User.digest(self.remember_token))
    end

    def forget
      self.update_attribute(:remember_digest, nil)
    end

    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
end
