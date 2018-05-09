require 'bcrypt'

class User
  include DataMapper::Resource
  include DataMapper::Validations

  attr_reader :password

  property :id, Serial
  property :email, String, :unique => true
  property :password_hash, Text

  validates_presence_of :email
  validates_uniqueness_of :email

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
