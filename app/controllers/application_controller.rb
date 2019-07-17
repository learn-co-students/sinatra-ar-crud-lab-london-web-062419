
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    redirect to "/articles"
  end 


  #new

  get '/articles/new' do 
    @article = Article.new
    erb :new
  end 

    #index
    get '/articles' do
      @articles = Article.all
      erb :index
    end

   #show

   get '/articles/:id' do 
    id = params[:id]
    @article = Article.find(id)
    erb :show
  end 

  #create
  post '/articles/?' do
    @article = Article.create(params) 

    redirect "/articles/#{@article.id}"
  end 

  #edit
  get '/articles/:id/edit' do 
    id = params[:id]
    @article = Article.find(params[:id])
    erb :edit
  end 
 
  #update
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    @article.save

    redirect "/articles/#{@article.id}"
  end  

  #delete
  delete '/articles/:id'  do 
    Article.destroy(params[:id])

    redirect "/articles"
  end 

end
