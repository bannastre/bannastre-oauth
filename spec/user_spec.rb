describe 'User' do

    before(:each) do
        @email = 'e@mail.com'
        password = 'secretPass123'
        User.create(email: @email, password: password)
    end

    it 'can persist a User to the db' do
        user = User.first(email: @email)
        expect(user.id).to be_a(Numeric)
    end
end
