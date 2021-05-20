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
    erb :bookmarks
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  enable :sessions, :method_override

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
