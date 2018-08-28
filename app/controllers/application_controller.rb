require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/team' do
      @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])

      member_info = params[:team][:member]

      @members =  member_info.map do |param|
        Member.new(name: param[:name], power: param[:power], bio: param[:bio])
      end


      erb :team
    end

end
