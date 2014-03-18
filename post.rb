require 'dm-core'
require 'dm-migrations'
require 'dm-timestamps'
require 'dm-validations'

#DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
#DataMapper::setup(:default, ENV['DATABASE_URL'])
DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
#DataMapper.setup(:default, 'postgres://localhost/postgres')

class Post 
	include DataMapper::Resource
	property :id, Serial
	property :content, Text
	property :username, String
	property :created_at, DateTime

	validates_length_of :content, :max => 200, :min => 1
	validates_length_of :username, :min => 3
	validates_with_method :check_spaces

	def check_spaces
		if username.match(/\s/)
			return false
		else
			true
		end
	end
end

DataMapper.finalize.auto_upgrade!;


