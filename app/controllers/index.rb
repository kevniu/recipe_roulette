require "dotenv"
Dotenv.load

get '/' do
  erb :index
end

get '/recipes' do
  if request.xhr?
    response = RestClient.get "http://food2fork.com/api/search?key=" + ENV['API_KEY'] + "="
    parsed_data = JSON.parse(response)
    recipes_arr = parsed_data["recipes"]
    recipe = recipes_arr[rand(recipes_arr.length)]
    erb :'_recipe', layout: false, locals: {recipe: recipe}
  else
    redirect '/'
  end
end

post '/recipes' do
  if request.xhr?
    string = params[:keyword]
    search_query = string.gsub(/\s/, '&20')
    response = RestClient.get "http://food2fork.com/api/search?key=" + ENV['API_KEY'] + "=#{search_query}"
    parsed_data = JSON.parse(response)
    recipes_arr = parsed_data["recipes"]
    recipe = recipes_arr[rand(recipes_arr.length)]
    erb :'_recipe', layout: false, locals: {recipe: recipe}
  else
    redirect '/'
  end
end
