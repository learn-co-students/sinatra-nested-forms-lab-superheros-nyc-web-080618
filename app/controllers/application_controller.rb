require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :index
    end # home route

    post '/teams' do
      @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
      supers = params[:team][:members]
      @super_heroes = supers.collect do |superhero_params|
        Superhero.new(name: superhero_params[:name], power: superhero_params[:power], bio: superhero_params[:bio])
      end
      erb :team
    end

end
