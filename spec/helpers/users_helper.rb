module UsersHelper
  def create_user(email: 'test@test.com', password: 'supersecret123')
    User.create(email: email, password: password)
  end

  def sign_up(email: 'test@test.com')
    visit '/'
    click_link 'Sign Up'
    fill_in :email, with: email
    fill_in :password, with: 'supersecret123'
    click_button 'Sign Up!'
  end

  def sign_in
    visit '/'
    click_link 'Sign In'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'supersecret123'
    click_button 'Sign In'
  end
end
