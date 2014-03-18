require 'sinatra'
require './post' #for database
require 'kronic' #for date time formatting

set :port, 3000

#home page
get '/' do
	#get a collection of all Post objects in the database
	#store it in an instance variable to be used by ERB
	@posts = Post.all
	erb :home
end

#about page
get '/about' do
	@title = "An app for people to flitter"
	erb :about
end 

#contact page, but not visible in the app
get '/contact' do
	@title = "Contact me: uohzxela at gmail.com"
	erb :contact
end

#404 error page
not_found do 
	erb :not_found
end

#executed when user posts a content
post '/new' do
	#create a new Post object in database
	p = Post.create(params[:post])
	p.created_at = Time.now
	#store content of new post in an instance variable
	#to be displayed to the user through ERB
	@content = p.content;
	p.save
	@posts = Post.all
	erb :home
end

#edit page where user edits the post
get '/edit' do
	p = Post.get(params[:id])
	#store the content in an instance variable to be used
	#by ERB so that user can see the original message before editing
	@content = p.content
	$post = p #set current Post object to global variable $post
	erb :edit
end

#executed after user finished editing
get '/edited' do
	p = $post #get the Post object to be deleted
	p.update(content: params[:content]) #update content of Post object
	p.save
	redirect to("/")
end

#executed when user deletes a post
get '/delete' do
	p = Post.get(params[:id]) #get Post object by specifying its ID
	p.destroy
	redirect to("/")
end

#executed when finding posts by username
get '/:user' do
	#get a collection of Post objects that has the specified username
	@posts = Post.all(:username => "#{params[:user]}")
	erb :home
end

