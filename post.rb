require 'dm-core'
require 'dm-migrations'
require 'dm-timestamps'
require 'dm-validations'

#DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
#DataMapper::setup(:default, ENV['DATABASE_URL'])
DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
class Post 
	include DataMapper::Resource
	property :id, Serial
	property :content, Text
	property :username, String
	property :created_at, DateTime

	validates_length_of :content, :max => 200, :min => 1
	validates_length_of :username, :min => 3
end

DataMapper.finalize;


