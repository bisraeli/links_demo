require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

get '/manual_links' do
  @links = ['http://reddit.com',
            'http://techcrunch.com',
            'http://gizmondo.com',
            'http://nytimes.com',
            'http://macrumors.com']
  erb :links
end

get '/links' do
  link_file = File.new('links.cvs', 'r')
  @links = []
  link_file.each do |line|
    @links << line.split(',')
  end
  link_file.close
  erb :links
end