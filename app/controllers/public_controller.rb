class PublicController < ApplicationController
  
	layout 'public'
	before_filter :setup_navigation

  def index
  	# Intro text!!!
  end

  def show
  	@page = Page.where(:permalink => params[:link], :visible => true).first
  	redirect_to(:action => "index") unless @page
  end

  private

  def setup_navigation 
  	@subjects = Subject.visible.sorted
  end
end
