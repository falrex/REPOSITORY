class StudentpageController < ApplicationController
  before_filter :logincheck 
  def logincheck
    if (session[:userid]==nil)
    redirect_to :controller=>"login", :action=>"index"
    end
  end
  def index
    #login= User.find(:all, :conditions=>"id='${session[:userid]}'"saasa
    
  end

end
