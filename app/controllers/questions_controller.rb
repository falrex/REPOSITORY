class QuestionsController < ApplicationController

  
  # GET /questions
  # GET /questions.xml
  def index
   if(params[:find]!=nil)
     session[:quizid]=params[:find]
      @questions = Question.find_by_sql("select * from questions
          where question= any
            (SELECT question from questions
              join publishquizzes
              on questions.id = question_id
              join quizzes
              on quizzes.id = quiz_id
              where quiz_id =
              "+params[:find]+")")
         flash[:done]="yeah"     
   elsif (params[:quiz]==nil)
      @questions=Question.all        
   else
      session[:quizid]=params[:quiz]
      @questions = Question.find_by_sql("select * from questions
                    where question!= all
                    (SELECT question from questions
                    join publishquizzes
                    on questions.id = question_id
                    join quizzes
                    on quizzes.id = quiz_id
                    where quiz_id =
                    "+session[:quizid]+")")
      @quizzes = Quiz.find(:all, :conditions=>"section_id = "+session[:sectionid]+" and status='Unpublished'")
      #@sections = Section.find(:all,:conditions=>"id = "+@quizzes[0].section_id.to_s)
      @sections = Section.find(:all,:conditions=>"id = "+session[:sectionid])
      @subject = Subject.find(:all,:conditions=>"id = "+@sections[0].subject_id.to_s)
      flash[:subjectname]=@subject[0].name
      flash[:sectionname]=@sections[0].section + " Quizzes"
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end
  
  # DELETEPUBLISH /questions/1
  # DELETEPUBLISH /questions/1.xml
  def deletepublish
     @question = Publishquiz.find(:all, :conditions=>"question_id="+params[:question]+" and quiz_id="+session[:quizid])
    @question[0].destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
      format.xml  { head :ok }
    end
  end
  
  def addquestions
     puts "------------------------------------------------------------------"
    @publishquiz = Publishquiz.new
    @publishquiz.question_id= params[:question]
    @publishquiz.quiz_id = session[:quizid] 
    @publishquiz.save
    redirect_to :controller=>"questions", :action=>"index", :quiz=>session[:quizid] 
  end
                 
  
  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  

  # GET /questions/new
  # GET /questions/new.xml
  def new
    @question = Question.new       
         
    #@publishquiz = Publishquiz.new
    #@publishquiz.question_id= params[:question]
    #@publishquiz.quiz_id = session[:quizid] 
    #@publishquiz.save
    #redirect_to :controller=>"questions", :action=>"index", :quiz=>session[:quizid] 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end
  
  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.xml
  def create
    if (params[:question]!=nil)
    @question = Question.new(params[:question])
    @question.subject_id=session[:subjectid]       
    else
    @question = Question.new
    end          
     
    respond_to do |format|
      if @question.save
        format.html { redirect_to(@question, :notice => 'Question was successfully created.') }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
      
  end
    
    if (params[:A]!=nil)
    @choices = Choice.new()
    @choices.value = params[:A]
    @choices.question_id=@question.id
    @choices.save 
    end
    if (params[:B]!=nil)
    @choices = Choice.new()
    @choices.value = params[:B]
    @choices.question_id=@question.id
    @choices.save 
    end
    if (params[:C]!=nil)
    @choices = Choice.new()
    @choices.value = params[:C]
    @choices.question_id=@question.id
    @choices.save 
    end
    
    @choices = Choice.new()
    @choices.value = @question.answer
    @choices.question_id=@question.id
    @choices.save 
    
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    @question = Question.find(params[:id])
    
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to(@question, :notice => 'Question was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
      format.xml  { head :ok }
    end
  end
end
