class LoginController < ApplicationController
  def index

  

  
  end
  
  def authenticate
    value = params[:username]
  
    login= Users.find(:all, :conditions=>"username='"+params[:username]+"'")
    puts login[0].username
    puts something blah
  end
end
