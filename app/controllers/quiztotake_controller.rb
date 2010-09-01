class QuiztotakeController < ApplicationController
  def index
    @subjects = Subject.find_by_sql("SELECT subjects.id, name, description 
    FROM subjects JOIN sections on subjects.id = sections.subject_id
    JOIN classlists on sections.id = classlists.section_id WHERE classlists.user_id = " + session[:userid])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subjects}
      
    end
  end

  def show
        if(params[:subject]==nil)
      @sections = Section.all
      
         else

            session[:subjectid]=params[:subject]
            
            @sections = Section.find_by_sql("SELECT sections.id, section, time, day from sections 
            JOIN classlists on sections.id = classlists.section_id
            where classlists.user_id = " + session[:userid] + " and sections.subject_id = " + session[:subjectid])
            @subject = Subject.find(:all,:conditions=>"id = "+params[:subject])
            flash[:subjectname]=@subject[0].name
          end
     respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sections }
    end
  end

  def takequiz
    
    @questions = Question.find_by_sql("select * from questions
          where question= any
            (SELECT question from questions
              join publishquizzes
              on questions.id = question_id
              join quizzes
              on quizzes.id = quiz_id
              where quiz_id = " + params[:quiz] + ")")
      session[:quizid]= params[:quiz]
      @choices = Choice.all

  end

  def result
  end
  
  def answer
    @q = Question.find_by_sql("select * from questions
          where question= any
            (SELECT question from questions
              join publishquizzes
              on questions.id = question_id
              join quizzes
              on quizzes.id = quiz_id
              where quiz_id = " + session[:quizid] + ")")
      @score = 0
      @q.each do |q|
        if( params[:post][q.id.to_s]==q.answer)
          @score=score+1
        end
      end
      
      
      @studentrecords = Studentrecord.new
      @studentrecords.quiz_id = session[:quizid]
      @studentrecords.user_id = session[:userid]
      @studentrecords.grade = @score
      @studentrecords.save
  end
  
  
  def choosequiz
    @quiz = Quiz.find_by_sql("select * from quizzes 
    WHERE quizzes.id != all(select quiz_id from studentrecords 
    where user_id = " + session[:userid] +") and quizzes.section_id = " + params[:section])
     # session[:quizid]= params[:quizid]
      #@choices = Choice.all
  end
end
