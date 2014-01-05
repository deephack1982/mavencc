class StaticPagesController < ApplicationController
  def home
  end

  def about
  end
  
  def site
  	@site = Site.first
  end
end
