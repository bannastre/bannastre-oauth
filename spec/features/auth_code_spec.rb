describe "Authorization Code", type: :feature do

    before(:each) do
        create_user
        sign_in
        visit '/authorize'
    end
    
    it "allows a user to visit the authorize route" do
        expect(page).to have_button "Generate New Code"
    end

    it "generates an authorization code" do
        click_button 'Generate New Code'
        expect(page).to have_content "Auth Code: "
    end

    def generate_code
        Authorization.create(email: 'test@test.com', hex_length: 32)
    end
end
