class Admin::AdminController < ApplicationController

  before_filter :ensure_authentication

  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
