class User < ApplicationRecord

    before_save { self.email = email.downcase}

    validates :name, presence: true,     length: { minimum: 5, maximum: 100 }
    validates :email, presence: true,    length: { minimum: 5, maximum: 100 },
                                         format: { with: URI::MailTo::EMAIL_REGEXP },
                                         uniqueness: { case_sensitive: false, message: "email already present" }

    has_secure_password :password
    validates :password, presence: true,     length: { minimum: 6, maximum: 30 }
                              
end
