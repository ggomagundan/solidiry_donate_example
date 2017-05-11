class SinatraDapp < Sinatra::Base

  #register Sinatra::Namespace

  configure do
    register Sinatra::Namespace
    set :public_folder, 'assets'

    set :environment, Sprockets::Environment.new

    # append assets paths
    environment.append_path "assets/stylesheets"
    environment.append_path "assets/javascripts"

    # compress assets
    #environment.js_compressor  = :uglify
    #environment.css_compressor = :scss
  end

  # get assets
  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "")
    settings.environment.call(env)
  end

  # Views
  get '/' do
    @web3 = Web3.new("https://ropsten.infura.io/XTrNmygmqG6zMCZen6TJ")

    erb :index
  end

end
