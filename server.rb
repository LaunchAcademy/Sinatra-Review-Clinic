require 'sinatra'
require 'pry'
require 'csv'

get '/' do
  redirect '/articles'
end

get '/articles' do
  @articles = CSV.readlines("articles.csv")

  erb :index
end

get "/articles/new" do
  erb :new
end

post "/articles/new" do
  @title = params["article_title"]
  @url = params["article_url"]
  @description = params["article_description"]

  if @title == "" || @url == "" || @description == ""
    @error = "Please fill out all of the forms correctly!"
    erb :new
  else

    CSV.open("articles.csv", "a") do |csv|
      csv << [title, url, description]
    end

    redirect "/articles"
  end

end











# CSV.foreach('articles.csv', headers: true, header_converters: :symbol) do |row|
#   @articles << row.to_hash
# end
