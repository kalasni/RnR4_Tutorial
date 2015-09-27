class User < ActiveRecord::Base

  attr_accessor :remember_token

  # Callback que convierte a minusculas el email antes de guardarlo en la bd
  before_save { self.email = email.downcase }

  # Se puede modificar el email directamente usando el bang !
  #before_save { email.downcase! }

# similar a  validates(:name, presence: true, length: {maximum: 50})
  validates :name, presence: true, length: {maximum: 50 }

  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness:{ case_sensitive: false }

  has_secure_password

  # allow_nil: true permite actualizar el perfil sin cambiar el password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                                                    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end


# Remembers a user in the database for use in persistent sessions
  def remember

    # Using self ensures that assignment sets the user’s remember_token attribute.
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest) == remember_token
    #BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

end
