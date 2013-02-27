enable  :sessions, :logging

set :session_secret, ENV['SESSION_SECRET'] || 'This is a secret bro!'

set :root, File.dirname(__FILE__)

get '/' do
  erb :index
end

post '/' do
  ""
end
