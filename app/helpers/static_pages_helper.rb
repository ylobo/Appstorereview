require 'rubygems'
require 'net/https'

module StaticPagesHelper
  def storeOptions()
    options=["Apple Store", "Google Store"]
    return options
  end
 
  def getAppReviewSummary
     report = SummaryReporterHelper::Summary.new(SummaryReporterHelper::AppleStoreSummary.new,499734091)
     report.getSummary
     ratingOfCurrentVersion=report.userRatingCountForCurrentVersion
     return ratingOfCurrentVersion
  end
  
end
