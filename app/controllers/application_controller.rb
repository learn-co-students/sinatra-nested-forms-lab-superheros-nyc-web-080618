require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do

      erb :super_hero
    end

    post '/teams' do

      @team_name = params[:team][:name]
      @team_motto = params[:team][:motto]
    
      params[:team][:members].each do |member|

        Hero.new(member)
      end

      @heroes = Hero.all

      erb :team
    end


end
