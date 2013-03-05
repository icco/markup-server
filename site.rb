enable :logging

set :root, File.dirname(__FILE__)

get '/' do
  erb :index
end

post '/' do
  content = params["content"]
  width = params["width"] || 500
  height = params["height"] || 500

  OEmbed::Providers.register_all

  content.split.map do |str|
    if str[0...4] == "http"
      res = OEmbed::Providers.get(str, {:maxwidth => width, :maxheight => height})
      res.html
    else
      str
    end
  end.join " "
end
