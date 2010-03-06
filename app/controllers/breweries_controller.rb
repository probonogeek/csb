class BreweriesController < ApplicationController

  # GET /admin/breweries
  # GET /admin/breweries.xml
  def index
    @breweries = Brewery.all
    @page_title = "Home"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @breweries }
    end
  end


end
