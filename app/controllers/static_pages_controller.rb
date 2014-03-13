class StaticPagesController < ApplicationController
  attr_accessor :errorMessage
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
    #flash.now[:success]=params[:options]
     params[:query1] = params[:query]||params[:query1]
     params[:options] = params[:options]
     if ((params[:query1]||params[:query2])!="")
      case params[:options][0]
      when "Apple Store"   
        report = SummaryReporterHelper::Summary.new(SummaryReporterHelper::AppleStoreSummary.new,params[:query]||params[:query1])
        report.getSummary
        if report.foundResult
          @userRatingCountForCurrentVersion=report.userRatingCountForCurrentVersion
          @averageUserRatingForCurrentVersion=report.averageUserRatingForCurrentVersion
          @averageUserRating=report.averageUserRating
          @userRatingCount=report.userRatingCount
          @artworkUrl60=report.artWorkUrl
          @artistName=report.artistName
          @artWorkUrl=report.artWorkUrl
        else
          flash[:notice] = "No Results Found"
          redirect_to root_url
        end    
      when "Google Store" 
        report = SummaryReporterHelper::Summary.new(SummaryReporterHelper::GoogleStoreSummary.new,params[:query]||params[:query1])
        report.getSummary
      else
       flash.now[:success]=params[:options]
      end  
     else
       
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
     end  
  end
end
