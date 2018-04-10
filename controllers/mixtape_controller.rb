class MixtapeController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader
  end

  get '/' do 

  	@title = "List of Mixtapes"

  	@mixtapes = Mixtape.all

  	erb :'mixtapes/index'

  end

  post '/' do 

  mixtape = Mixtape.new
  mixtape.title = params[:title]
  mixtape.body = params[:body]

  mixtape.save

  redirect '/'

  end


  get '/new' do 

  	@mixtape = Mixtape.new
  	@mixtape.id = ""
  	@mixtape.title = "" 
  	@mixtape.body = "" 

  	erb :'/mixtapes/new'


  end 

  get '/:id' do 

  	id = params[:id].to_i 

  	@mixtape = Mixtape.find(id)

  	erb :'mixtapes/show'


  end 

  get '/:id/edit' do

  	id = params[:id].to_i 

  	@mixtape = Mixtape.find(id)

  	erb :'mixtapes/edit' 

  end 

  put '/:id' do

  	id = params[:id].to_i 

  	@mixtape = Mixtape.find(id)

  	mixtape.title = params[:title]
  	mixtape.body = params[:body]

  	mixtape.save

  	redirect '/'


  end 

  delete '/:id' do 

  	id = params[:id].to_i

  	Mixtape.destroy(id)

  	redirect '/'


  end 


end