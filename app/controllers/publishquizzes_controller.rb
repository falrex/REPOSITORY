class PublishquizzesController < ApplicationController
  # GET /publishquizzes
  # GET /publishquizzes.xml
  def index
    @publishquizzes = Publishquiz.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @publishquizzes }
    end
  end

  # GET /publishquizzes/1
  # GET /publishquizzes/1.xml
  def show
    @publishquiz = Publishquiz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @publishquiz }
    end
  end

  # GET /publishquizzes/new
  # GET /publishquizzes/new.xml
  def new
    @publishquiz = Publishquiz.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @publishquiz }
    end
  end

  # GET /publishquizzes/1/edit
  def edit
    @publishquiz = Publishquiz.find(params[:id])
  end

  # POST /publishquizzes
  # POST /publishquizzes.xml
  def create
    @publishquiz = Publishquiz.new(params[:publishquiz])

    respond_to do |format|
      if @publishquiz.save
        format.html { redirect_to(@publishquiz, :notice => 'Publishquiz was successfully created.') }
        format.xml  { render :xml => @publishquiz, :status => :created, :location => @publishquiz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @publishquiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /publishquizzes/1
  # PUT /publishquizzes/1.xml
  def update
    @publishquiz = Publishquiz.find(params[:id])

    respond_to do |format|
      if @publishquiz.update_attributes(params[:publishquiz])
        format.html { redirect_to(@publishquiz, :notice => 'Publishquiz was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @publishquiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /publishquizzes/1
  # DELETE /publishquizzes/1.xml
  def destroy
    @publishquiz = Publishquiz.find(params[:id])
    @publishquiz.destroy

    respond_to do |format|
      format.html { redirect_to(publishquizzes_url) }
      format.xml  { head :ok }
    end
  end
end
