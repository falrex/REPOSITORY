class LoginController < ApplicationController
  def index
reset_session
  

  
  end
  
  def authenticate
    value = params[:username]
    reset_session
    login= User.find(:all, :conditions=>"username='"+params[:username]+"' and password = '" + params[:password]+"'")
    if(login.length<=0)
      flash[:error] = "Incorrect Username or Password"
      redirect_to :action=>"index"
      
      
    else
      session[:userid]=login[0].id.to_s
      session[:fname]=login[0].fname.to_s
      session[:usertype]=login[0].category.to_s
      if (login[0].category== "Teacher")
        redirect_to :controller=>"teacherpage"
      elsif (login[0].category == "Admin")
        redirect_to :controller=>"adminpage", :action=>"index"        
      elsif (login[0].category == "Student")
        redirect_to :controller=>"studentpage"
      end
      
    end
    
  end
end
