#load gems
require 'sinatra'
require "sinatra/activerecord"
require 'omniauth-twitter'
require 'twitter'
require 'httparty'
#imports all Models
Dir["./models/*.rb"].each { |file| require file }

#load local files
require './config/environments' #database configuration
configure do
  set :bind, '0.0.0.0'
  set :server, 'thin'
  enable :sessions
  set :session_secret, "My session secretls
  "
  use OmniAuth::Builder do
    #I know this bad form but I haven't deployed yet. So Shhhhhhhh
    provider :twitter, 'I6gNM9MZzC0NctgptLDYkW8SE', 't2wGiaqZdCNn0GXbCkkVkXh3jBQB9dcf9gK6D4XKemJ2kFPsN6'
  end
end

get "/" do
  "welcome"
end

post "/" do
  "#{params.inspect}"
end

get '/search?:skills?' do
  #there must be a smart way to optimize this
  @users = []
  params[:skills].split(',').each do |skill|
    @users.push Skill.where(name: skill).users.to_a
  end
  @users.uniq{|x| x.email}
  @result = ""
  @users.each do |user|
    @result += "#{user.to_s}"
  end
  @result
end

post '/signup' do
  @user = User.find_by(email: params[:email])
  if @user
    "Email is already in use. Please try another"
  else
    if params[:password] != params[:password_confirm]
      "Passwords don't match, please try again"
    else
      User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirm])
      "#{User.last.id}"
    end
  end
end

post '/login' do
  @output = ""
  if @user = User.find_by(email:  params[:email]).try(:authenticate, params[:password])
    @output = "#{@user.id}"
  else
    @output = "Failed to Login. Please Check your Email or Password are Correct"
  end
  @output
end

post '/update_user' do
  @user = User.find(params[:id])
  @user.name = params[:name]
  @user.prog_type = params[:prog_type]
  @user.employer = params[:true]
  @user.looking_for = params[:looking_for]
  @user.location = params[:location]
  @user.blob = params[:blob]
  @user.save
  "Success"
end

post '/upload_pic' do
  puts params.inspect
  "#{params.inspect}"
end

get '/user/?:id?' do
  "#{User.find(params[:id]).to_json}"
end

get '/user/?:id?/threads' do

end

get '/random_user' do
  @offset = rand(User.count)
  "#{User.offset(@offset).first.to_json}"
end

get '/conversations' do
  convos = Conversation.where("user_a_id = ? OR user_b_id = ?", params[:id], params[:id])
  first_messages = []
  convos.each do |c|
    m = c.messages.where.not("user_id = ?",params[:id]).last
    first_messages.push [User.find(m.user_id).name , m.data]
  end
  "#{first_messages.to_a}"
end

get '/user_skills/?:id?' do
  "#{User.find(params[:id]).skills.to_json}"
end

get '/login/twitter' do
  redirect to("/auth/twitter")
end

get '/auth/failure' do
  params[:message]
end

get '/auth/twitter/callback' do
  session[:username] = env['omniauth.auth']['info']['name']
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "I6gNM9MZzC0NctgptLDYkW8SE"
    config.consumer_secret     = "t2wGiaqZdCNn0GXbCkkVkXh3jBQB9dcf9gK6D4XKemJ2kFPsN6"
    config.access_token        = env['omniauth.auth'][:credentials][:token]
    config.access_token_secret = env['omniauth.auth'][:credentials][:secret]
  end
  "#{env['omniauth.auth']}<br><br>#{env['omniauth.auth'][:credentials][:token]}<br>#{env['omniauth.auth'][:credentials][:secret]}"
end
