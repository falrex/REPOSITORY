class TeacherpageController < ApplicationController
  def index
    #login= User.find(:all, :conditions=>"id='${session[:userid]}'"
    
  end
  
  def logout
    reset_session
    redirect_to :controller=>"login"
  end
  
  def publish
     
     Quiz.update(session[:quizid],:status=>"Published")
     redirect_to :controller=>"quizzes", :action=>"index", :section=>session[:sectionid]
  end
  
    def addquestions
     
    @publishquiz = Publishquiz.new
    @publishquiz.question_id= params[:question]
    @publishquiz.quiz_id = session[:quizid] 
    @publishquiz.save
    redirect_to :controller=>"questions", :action=>"index", :quiz=>session[:quizid] 
  end
end 
