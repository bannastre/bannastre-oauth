feature "User management", type: :feature do
  scenario "Shows a welcome message on the front page" do
    visit "/"

    expect(page).to have_content("Bannastre OAuth")
  end

  scenario "I can sign up as a user" do
    sign_up
    expect(page).to have_content("Logged in as: test@test.com")
  end

  scenario "I can't sign up with an already taken email address" do
    sign_up
    visit "/"
    click_button "Sign Out"
    sign_up(email: "test@test.com")
    expect(page).to have_content("Email is already taken")
  end

  scenario "I can sign in as a user" do
    create_user
    visit "/"
    click_link "Sign In"
    fill_in :email, with: "test@test.com"
    fill_in :password, with: "supersecret123"
    click_button "Sign In"
    expect(page).to have_content("Logged in as: test@test.com")
  end

  scenario "I can sign out" do
    create_user
    sign_in

    visit "/"
    click_button "Sign Out"
    expect(page).to have_content("Sign In")
  end
end
