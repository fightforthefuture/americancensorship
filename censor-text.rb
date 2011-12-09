require "sinatra"
require "sequel"

DB = Sequel.connect(:adapter => 'postgres', :host => 'localhost', :database => 'blog', :user => 'cbryan', :password => 'caR9itas')

require File.dirname(__FILE__) + "/models/post"

get "/" do
  erb :index
end

post "/censor" do
  
end

get "/uncensor/:id" do
  @id = params[:id]
  erb :index
end
