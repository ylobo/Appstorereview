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
    #flash.now[:success]=params[:options]
     params[:query1] = params[:query]||params[:query1]
     params[:options] = params[:options]
     if ((params[:query1]||params[:query2])!="")
      case params[:options][0]
      when "Apple Store"   
        report = SummaryReporterHelper::Summary.new(SummaryReporterHelper::AppleStoreSummary.new,params[:query]||params[:query1])
        report.getSummary
        @userRatingCountForCurrentVersion=report.userRatingCountForCurrentVersion
        @averageUserRatingForCurrentVersion=report.averageUserRatingForCurrentVersion
        @averageUserRating=report.averageUserRating
        @userRatingCount=report.userRatingCount
        @artworkUrl60=report.artWorkUrl
        @artistName=report.artistName
        @artWorkUrl=report.artWorkUrl
      when "Google Store" 
        report = SummaryReporterHelper::Summary.new(SummaryReporterHelper::GoogleStoreSummary.new,params[:query]||params[:query1])
        report.getSummary
      else
       flash.now[:success]=params[:options]
      end  
     else
       redirect_to root_path
       flash.now[:error] = "Query field cannot be left empty"
     end  
  end
end
