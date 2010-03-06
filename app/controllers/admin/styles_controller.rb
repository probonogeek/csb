class Admin::StylesController < ApplicationController
  # GET /admin/breweries
  # GET /admin/breweries.xml
  def index
    @breweries = Brewery.find(:all, :include => :styles )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @breweries }
    end
  end

  # GET /admin/styles/1
  # GET /admin/styles/1.xml
  def show
    @style = Style.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @style }
    end
  end

  # GET /admin/styles/new
  # GET /admin/styles/new.xml
  def new
    @style = Style.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @style }
    end
  end

  # GET /styles/1/edit
  def edit
    @style = Style.find(params[:id])
  end

  # POST /admin/styles
  # POST /admin/styles.xml
  def create
    @style = Style.new(params[:style])

    respond_to do |format|
      if @style.save
        format.html { redirect_to([:admin,@style], :notice => 'Brewery was successfully created.') }
        format.xml  { render :xml => @style, :status => :created, :location => @style }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @style.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/styles/1
  # PUT /admin/styles/1.xml
  def update
    @style = Style.find(params[:id])

    respond_to do |format|
      if @style.update_attributes(params[:style])
        format.html { redirect_to([:admin,@style], :notice => 'Style was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @style.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/styles/1
  # DELETE /admin/styles/1.xml
  def destroy
    @style = Style.find(params[:id])
    @style.destroy

    respond_to do |format|
      format.html { redirect_to(admin_styles_url, :notice => 'Style was succesfully destroyed.') }
      format.xml  { head :ok }
    end
  end

end
