Snowflake::Admin.controllers :sessions do
  get :new do
    render "/sessions/new", nil, :layout => false
  end

  post :create do
    if account = Account.authenticate(params[:email], params[:password])
      set_current_account(account)
      redirect url(:base, :index)
    elsif Padrino.env == :development && params[:bypass]
      account = Account.first
      set_current_account(account)
      session[:account_id] = account.id
      redirect url(:base, :index)
    else
      params[:email], params[:password] = h(params[:email]), h(params[:password])
      flash[:error] = pat('login.error')
      redirect url(:sessions, :new)
    end
  end

  get :register do
    render "/sessions/register", :layout => false
  end

  post :register do
    @account = Account.create(:name => params[:name], :surname => params[:surname], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :role => "user")
    if @account.save
      set_current_account(@account)
      session[:account_id] = @account.id
      redirect '/'
    else
      @debug = params
      flash[:error] = "There was an error with your registration."
      render "/sessions/register", :layout => false
    end
  end

  delete :destroy do
    set_current_account(nil)
    session[:account_id] = nil
    redirect url(:sessions, :new)
  end
end
