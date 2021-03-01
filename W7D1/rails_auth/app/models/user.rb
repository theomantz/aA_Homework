class User < ApplicationRecord
    
    attr_reader :password

    validates :password_digest, presence: { message: "Password cannot be blank " }
    validates :password, length: {minimum: 6, allow_nil: true}

    before_validation :password

    def self.find_by_credentials(username, password)
        @user = User.find_by(username: username )
        return nil if @user.nil?
        if @user.is_password?(password)
            @user
        end
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    # validates :username, :session_token, presence: true

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
    
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def ensure_session_token
        @user.reset_session_token! if @user.session_token.nil?
    end
end
