class TeacherpageController < ApplicationController
  def index
    #login= User.find(:all, :conditions=>"id='${session[:userid]}'"
    
  end

  def publish
     
     Quiz.update(session[:quizid],:status=>"Published")
     redirect_to :controller=>"quizzes", :action=>"index", :section=>session[:sectionid]
  end
end 
