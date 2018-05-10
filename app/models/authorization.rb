require 'securerandom'

class Authorization
    include DataMapper::Resource
    include DataMapper::Validations
  
    property :id, Serial
    property :email, String, :unique => true
    property :auth_code, Text
  
    validates_presence_of :email
    validates_uniqueness_of :email

    def hex_length=(n)
        self.auth_code = SecureRandom.hex(n)
    end
  end