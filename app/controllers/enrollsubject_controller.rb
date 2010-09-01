class EnrollsubjectController < ApplicationController
  before_filter :logincheck 
  def logincheck
    if (session[:userid]==nil)
    redirect_to :controller=>"login", :action=>"index"
    end
  end
  
  def index
    @subjects = Subject.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subjects}
      
    end
  end
  

  def select
    if(params[:subject]==nil)
      @sections = Section.all
      
   else
    @classlist = Classlist.find_by_sql("SELECT MIN(id)as id FROM classlists")
     if(@classlist.id >= 0)
       
           session[:subjectid]=params[:subject]
            
            @sections = Section.find_by_sql("select * from sections
                      where id != all
                      (select section_id from classlists
                      where classlists.user_id = " +session[:userid]+"
                      ) and subject_id = " + session[:subjectid])
            @subject = Subject.find(:all,:conditions=>"id = "+params[:subject])
            flash[:subjectname]=@subject[0].name
         
     else
        session[:subjectid]=params[:subject]
        
        #session[:testkoko] = @classlist
        @sections = Section.find(:all, :conditions=>"subject_id = "+params[:subject])
        @subject = Subject.find(:all,:conditions=>"id = "+params[:subject])
        flash[:subjectname]=@subject[0].name

       
     end 
   end
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sections }
    end
  
  end

  def enroll
    @classlist = Classlist.new
    @classlist.user_id = session[:userid]
    @classlist.section_id = params[:section]
    @classlist.save
  end

end
