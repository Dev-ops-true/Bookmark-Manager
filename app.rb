require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/bookmark'

class Bookmarks < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks/new' do
    erb :'/bookmarks/new'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all_bookmarks
    erb :'bookmarks'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
