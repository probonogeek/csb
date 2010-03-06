class Admin::BatchesController < ApplicationController

  # GET /admin/batches/1
  # GET /admin/batches/1.xml
  def show
    @batch = Batch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @batch }
    end
  end

  # GET /admin/batches/new
  # GET /admin/batches/new.xml
  def new
    @batch = Batch.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @batch }
    end
  end

  # POST /admin/batches
  # POST /admin/batches.xml
  def create
    @batch = Batch.new(params[:batch])

    respond_to do |format|
      if @batch.save
        format.html { redirect_to([:admin,@batch], :notice => 'Batch was successfully created.') }
        format.xml  { render :xml => @batch, :status => :created, :location => @batch }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @batch.errors, :status => :unprocessable_entity }
      end
    end
  end

end
