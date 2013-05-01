module Snowflake
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    ##
    # Caching support
    #
    # register Padrino::Cache
    # enable :caching
    #
    # You can customize caching store engines:
    #
    # set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', :exception_retry_limit => 1))
    # set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new('127.0.0.1:11211', :exception_retry_limit => 1))
    # set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => '127.0.0.1', :port => 6379, :db => 0))
    # set :cache, Padrino::Cache::Store::Memory.new(50)
    # set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache')) # default choice
    #

    ##
    # Application configuration options
    #
    # set :raise_errors, true       # Raise exceptions (will stop application) (default for test)
    # set :dump_errors, true        # Exception backtraces are written to STDERR (default for production/development)
    # set :show_exceptions, true    # Shows a stack trace in browser (default for development)
    # set :logging, true            # Logging in STDOUT for development and file for production (default only for development)
    # set :public_folder, 'foo/bar' # Location for static assets (default root/public)
    # set :reload, false            # Reload application files (default in development)
    # set :default_builder, 'foo'   # Set a custom form builder (default 'StandardFormBuilder')
    # set :locale_path, 'bar'       # Set path for I18n translations (default your_app/locales)
    # disable :sessions             # Disabled sessions by default (enable if needed)
    # disable :flash                # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
    # layout  :my_layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
    #

    ##
    # You can configure for a specified environment like:
    #
    #   configure :development do
    #     set :foo, :bar
    #     disable :asset_stamp # no asset timestamping for dev
    #   end
    #

    get '/' do
      if session[:username].nil?
        redirect '/login'
      end
      erb :story_list
    end

    get '/story/:id/1' do
      erb :sentence_summary
    end

    post '/story/:id/1' do

      redirect '/story/:id/2'
    end

    get '/story/:id/2' do
      erb :paragraph_summary
    end

    post '/story/:id/2' do

      redirect '/story/:id/3'
    end

    get '/story/:id/3' do
      erb :character_summaries
    end

    post '/story/:id/3' do

      redirect '/story/:id/4'
    end

    get '/story/:id/4' do
      erb :page_summary
    end

    post '/story/:id/4' do

      redirect '/story/:id/5'
    end

    get '/story/:id/5' do
      erb :character_long_summaries
    end

    post '/story/:id/5' do

      redirect '/story/:id/6'
    end

    get '/story/:id/6' do
      erb :four_page_summary
    end

    post '/story/:id/6' do
      redirect '/story/:id/7'
    end

    get '/story/:id/7' do
      erb :character_charts
    end

    post '/story/:id/7' do
      erb :get_writing
    end

    ##
    # You can manage errors like:
    #
    #   error 404 do
    #     render 'errors/404'
    #   end
    #
    #   error 505 do
    #     render 'errors/505'
    #   end
    #
  end
end
