class QuizzesController < ApplicationController
  # GET /quizzes
  # GET /quizzes.xml
  def index
   
    if(params[:section]==nil)
       @quizzes = Quiz.all
   else
      session[:sectionid]=params[:section]
      @quizzes = Quiz.find(:all, :conditions=>"section_id = "+params[:section]+" and status='Unpublished'")
      #@sections = Section.find(:all,:conditions=>"id = "+@quizzes[0].section_id.to_s)
      @sections = Section.find(:all,:conditions=>"id = "+params[:section])
      @subject = Subject.find(:all,:conditions=>"id = "+@sections[0].subject_id.to_s)
      flash[:subjectname]=@subject[0].name
      flash[:sectionname]=@sections[0].section + " Quizzes"
   end
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quizzes }
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.xml
  def show
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quiz }
    end
  end

  # GET /quizzes/new
  # GET /quizzes/new.xml
  def new
    @quiz = Quiz.new
    session[:sectionid]=params[:section]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quiz }
    end
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
  end

  # POST /quizzes
  # POST /quizzes.xml
  def create
    @quiz = Quiz.new(params[:quiz])
    @quiz.section_id= session[:sectionid]
    @quiz.status = "Unpublished"
    respond_to do |format|
      if @quiz.save
        format.html { redirect_to(@quiz, :notice => 'Quiz was successfully created.') }
        format.xml  { render :xml => @quiz, :status => :created, :location => @quiz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quiz.errors, :status => :unprocessable_entity }
      end
    end
  session[:sectionid]=nil  
  end

  # PUT /quizzes/1
  # PUT /quizzes/1.xml
  def update
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      if @quiz.update_attributes(params[:quiz])
        format.html { redirect_to(@quiz, :notice => 'Quiz was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.xml
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to(quizzes_url) }
      format.xml  { head :ok }
    end
  end
end
