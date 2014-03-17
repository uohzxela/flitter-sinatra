require 'dm-core'
require 'dm-migrations'
require 'dm-timestamps'
require 'dm-validations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Post 
	include DataMapper::Resource
	property :id, Serial
	property :content, Text
	property :username, String
	property :created_at, DateTime

	validates_length_of :content, :max => 200
end

DataMapper.finalize;


