class AdminpageController < ApplicationController
       before_filter :logincheck 
  def logincheck
    if (session[:userid]==nil)
    redirect_to :controller=>"login", :action=>"index"
    end
  end
  def index
  end

end
