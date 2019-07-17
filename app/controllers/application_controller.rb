
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do

    redirect to "/articles"
  end


  get "/articles" do 
    @articles = Article.all
    erb :index
  
  end



  # create a route to create a new article
  get "/articles/new" do
    @article = Article.new
    erb :new
  end
  
  get "/articles/:id/edit" do
  id = params[:id]
  @article = Article.find(id)
  erb :edit
  end

  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
redirect to "/articles/#{@article.id}"
  end


  # post the articles to the DB & on the articles page
  post "/articles/?" do
     @article = Article.create(params)

    redirect to "/articles/#{@article.id}"
  end

  get "/articles/:id" do

    @article = Article.find(params[:id])
    erb :show
  end


  delete "/articles/:id" do
    Article.destroy(params[:id])

    redirect to "/articles"
  end

end
