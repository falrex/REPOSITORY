class TeacherpageController < ApplicationController
       before_filter :logincheck 
  def logincheck
    if (session[:userid]==nil)
    redirect_to :controller=>"login", :action=>"index"
    end
  end
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
  
  def generate
  session[:quizid]=params[:quiz]
  @questions = Question.find(:all, :conditions=>"subject_id="+session[:subjectid]+" and difficulty='Hard'")   
  @hard = @questions.length
  @questions = Question.find(:all, :conditions=>"subject_id="+session[:subjectid]+" and difficulty='Moderate'")
  @moderate = @questions.length
  @questions = Question.find(:all, :conditions=>"subject_id="+session[:subjectid]+" and difficulty='Easy'")  
  @easy = @questions.length  
  end
  
  def generatequestion
  @questions=Question.find(:all, :conditions=>"subject_id="+session[:subjectid]+" and difficulty='"+params[:dif]+"'")
    @questions.each do |quest|
    publish = Publishquiz.new
    publish.question_id=quest.id
    publish.quiz_id=session[:quizid]
    publish.save
    end
  publish
  
  end
  
  def close
    Quiz.update(params[:quiz],:status=>"Closed")
     redirect_to :controller=>"quizzes", :action=>"index"
     
  end
  
  def grades
    @grades = Studentrecord.find_by_sql("select fname,lname,grade,quizzes.name as quizname,count(question_id) as total from studentrecords
join quizzes
on quizzes.id = studentrecords.quiz_id
join sections
on sections.id = quizzes.section_id
join users
on users.id = studentrecords.user_id
join publishquizzes
on publishquizzes.quiz_id = quizzes.id
where sections.id =6
group by users.id")
  end
end 
