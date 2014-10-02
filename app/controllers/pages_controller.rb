class PagesController < ApplicationController
  def home
	  @tournaments = Tournament.all
  end

  def tournaments
  end
  
end
