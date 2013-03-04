enable  :sessions, :logging

set :session_secret, ENV['SESSION_SECRET'] || 'This is a secret bro!'

set :root, File.dirname(__FILE__)

get '/' do
  erb :index
end

post '/' do
  content = params["content"]
  width = params["width"] || 500
  height = params["height"] || 500

  OEmbed::Providers.register_all

  url = ""
  res = OEmbed::Providers.get(url, {:maxwidth => width, :maxheight => height})
  res.html
end
