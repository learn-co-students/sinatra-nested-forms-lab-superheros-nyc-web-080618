require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :index
    end

    post '/team' do
      @team = Team.new(params[:team][:name],params[:team][:motto])
      params[:team][:heroes].each do |hero|
        Hero.new(hero[:name],hero[:power],hero[:bio])
      end
      @heroes = Hero.all
      erb :team
    end

end
