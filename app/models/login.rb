require "bcrypt"

class Login
  def initialize(user_model)
    @user_model = user_model || User
  end

  def user(email, password)
    user = user_model.first(email: email)
    user && BCrypt::Password.new(user.password_hash) == password ? user : nil
  end

  private

  attr_reader :user_model
end
