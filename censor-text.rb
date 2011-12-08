require "sinatra"
require "sequel"

DB = Sequel.sqlite

get "/" do
  erb :index
end

post "/uncensor/new" do

end

get "/uncensor/:id" do
  @id = params[:id]
  erb :index
end
