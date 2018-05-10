require 'data_mapper'
require 'dm-postgres-adapter'

require_relative "models/user"
require_relative "models/authorization"

localdb = "postgres://localhost/oauth_#{ENV['RACK_ENV']}"

DataMapper.setup(:default, ENV['DATABASE_URL'] || localdb)
DataMapper.finalize
DataMapper.auto_upgrade!
