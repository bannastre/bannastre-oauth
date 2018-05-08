describe "User Management", type: :feature do
    it "allows a user to sign up" do
        visit '/'
        click_link 'Sign Up'
        fill_in :email, with('test@test.com')
        fill_in :password, with('secret123')
        click_button 'Sign Up!'
        expect(page).to have_content("Welcome, Test User!")
    end
end
