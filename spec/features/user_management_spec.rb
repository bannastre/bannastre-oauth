describe "User Management", type: :feature do
    it "allows a user to sign up" do
        visit '/'
        click_link 'Sign Up'
        fill_in :user_email, with: 'test@test.com'
        fill_in :user_password, with: 'secret123'
        click_button 'Sign Up!'
        expect(page).to have_content("Welcome, test@test.com!")
    end
end
