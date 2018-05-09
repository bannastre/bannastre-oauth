describe "Index", type: :feature do
    it "allows a user to visit the Index" do
        visit '/'
        expect(page).to have_content 'Bannastre OAuth'
    end
end
