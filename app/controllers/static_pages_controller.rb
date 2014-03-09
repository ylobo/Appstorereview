class StaticPagesController < ApplicationController
  
  def home
    @reviews=[]
    #flash[:success]=params[:query]
   # if @reviews.count != 0
    # flash[:success] = "Micropost created!"
    #else
     #flash[:success] = "Micropost not created!"   
    #end
  end
  
  def results
     #flash.now[:success]=getAppReviewSummary()
     params[:query1] = params[:query]||params[:query1]
  end
end
