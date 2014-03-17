require 'sinatra'
require './post'
require 'kronic'

set :port, 3000

get '/' do
	@posts = Post.all
	erb :home
end

get '/about' do
	@title = "An app for people to flitter"
	erb :about
end 

get '/contact' do
	@title = "Contact me: uohzxela at gmail.com"
	erb :contact
end

not_found do 
	erb :not_found
end


post '/new' do
	p = Post.create(params[:post])
	p.created_at = Time.now
	@content = p.content;
	p.save
	@posts = Post.all
	erb :home
end

get '/edit' do
	p = Post.get(params[:id])
	@content = p.content
	$post = p
	erb :edit
end

get '/edited' do
	p = $post
	p.update(content: params[:content])
	p.save
	redirect to("/")
end

get '/delete' do
	p = Post.get(params[:id])
	p.destroy
	redirect to("/")
end


get '/:user' do
	@posts = Post.all(:username => "#{params[:user]}")
	erb :home
end

