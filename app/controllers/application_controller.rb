require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

<<<<<<< HEAD
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create({:title => params[:title], :content => params[:content]})
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles' do
=======
  get '/' do
    redirect to "/articles"
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do 
>>>>>>> 6f7477ddd0119e860499e4a24cb20a806333cb37
    @articles = Article.all
    erb :index
  end

<<<<<<< HEAD
=======
  post '/articles' do
    Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{Article.last.id}"
  end 

>>>>>>> 6f7477ddd0119e860499e4a24cb20a806333cb37
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
<<<<<<< HEAD

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
=======
  
  get '/articles/:id/edit' do
    @art = Article.find(params[:id])
>>>>>>> 6f7477ddd0119e860499e4a24cb20a806333cb37
    erb :edit
  end

  patch '/articles/:id' do
<<<<<<< HEAD
    @article = Article.find(params[:id].to_i)
    @article.update(:title => params[:title], :content => params[:content])
    redirect "/articles/#{Article.last.id}"
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id].to_i)
    @article.destroy
    redirect '/articles'
  end

=======
    @a = Article.find(params[:id])
    @a.update(title: params[:title], content: params[:content])
    redirect "/articles/#{@a.id}"
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end
    

  
>>>>>>> 6f7477ddd0119e860499e4a24cb20a806333cb37
end