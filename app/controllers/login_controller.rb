class LoginController < ApplicationController
  def index

  

  
  end
  
  def authenticate
    value = params[:username]
  
    login= User.find(:all, :conditions=>"username='"+params[:username]+"'")
    if(login.length<=0)
      flash[:error] = "Incorrect Username or Password"
      redirect_to :action=>"index"
    else
      puts login[0].username
      
      redirect_to :controller=>"users", :action=>"index"
    end
    
  end
end
