require 'dm-core'
require 'dm-migrations'
require 'dm-timestamps'
require 'dm-validations'

#if running on localhost, sqlite3 db is used
#otherwise, if running on heroku, postgresql is used
DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
#DataMapper.setup(:default, 'postgres://localhost/postgres')

class Post 
	include DataMapper::Resource
	property :id, Serial
	property :content, Text
	property :username, String
	property :created_at, DateTime

	#length of post must at least be 200 chars
	validates_length_of :content, :max => 200, :min => 1
	#length of username must at least be 3 chars
	validates_length_of :username, :min => 3
	#username cannot have spaces
	validates_with_method :check_spaces

	def check_spaces
		if username.match(/\s/)
			return [ false, "Username must not have spaces"]
		else
			true
		end
	end
end

DataMapper.finalize.auto_upgrade!;


