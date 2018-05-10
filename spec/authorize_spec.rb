require './app/models/authorization'

describe Authorization do
    subject(:auth_model) { described_class.new(email: 'test@test.com', hex_length: 32) }

    context "When user is found by email" do

        before do
            subject.save
        end
        
        it "grants an auth_token" do
            expect(subject.auth_code.length).to be 64
        end
    end
end