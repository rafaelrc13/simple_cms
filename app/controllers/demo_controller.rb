class DemoController < ApplicationController
  
  layout "admin"

  def index
  #	render("hello")
  #	redirect_to(:controller => 'demo', :action => 'other_hello')
  end

  def hello
  #	redirect_to("http://www.lynda.com")
  	@array = [1,2,3,4,5]
  	@id = params[:id].to_i
  	@page = params[:page].to_i
  end

  def other_hello 
  	render(:text => "Hello Everyone")
  end

  def text_helpers 
  end

  def escape_output 
  end

  def logging 
    @subjects = Subject.all
    ActiveSupport::Deprecation.warn("This is a deprecation.")
    logger.debug("This is debug.")
    logger.info("This is info.")
    logger.warn("This is warn.")
    logger.error("This is error.")
    logger.fatal("This is fatal")
    render(:text => 'Logged')
  end

end
