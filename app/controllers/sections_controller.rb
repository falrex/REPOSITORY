class SectionsController < ApplicationController
  # GET /sections
  # GET /sections.xml
  def index
   if(params[:subject]==nil)
      @sections = Section.all
      @sections = Section.find_by_sql("SELECT * FROM `sections`
join subjects
on subjects.id = subject_id
where user_id = 
" + session[:userid])
   else
      session[:subjectid]=params[:subject]
      
      
      @sections = Section.find(:all, :conditions=>"subject_id = "+params[:subject]+" and user_id = "+session[:userid])
      @subject = Subject.find(:all,:conditions=>"id = "+params[:subject])
      flash[:subjectname]=@subject[0].name 
   end
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sections }
    end
  end
  

  
  # GET /sections/1
  # GET /sections/1.xml
  def show
    @section = Section.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @section }
    end
  end

  # GET /sections/new
  # GET /sections/new.xml
  def new
    @section = Section.new

    #@a = Subject.find(params[:subject])
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
    
  end

  # POST /sections
  # POST /sections.xml
  def create
    @section = Section.new(params[:section])
    
    @section.user_id=session[:userid]
    @section.subject_id=session[:subjectid]
    respond_to do |format|
      if @section.save
        format.html { redirect_to(@section, :notice => 'Section was successfully created.') }
        format.xml  { render :xml => @section, :status => :created, :location => @section }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
      end    
    end
    
  end

  # PUT /sections/1
  # PUT /sections/1.xml
  def update
    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to(@section, :notice => 'Section was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.xml
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to(sections_url) }
      format.xml  { head :ok }
    end
  end
end
