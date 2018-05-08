describe "Index", type: :feature do
    it "allows a user to visit the Index" do
        visit '/'
        expect(page).to have_content 'Hello, World!'
    end
end
