class Admin::AdminController < ApplicationController

  before_filter :ensure_authentication

  def index
    @page_title = "Administration"
    @page_description = "Because Stuff has to Get Done"


    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
