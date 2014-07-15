class StaticPagesController < ApplicationController

	before_filter :authorise

  def home
  end

  def about
  end
  
  def site
  	@site = Site.first
  end
end
