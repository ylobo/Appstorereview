require 'rubygems'
require 'net/https'
require 'uri'
require 'json'
#=begin
module SummaryReporterHelper
  class Summary
    attr_accessor :appStore, :summary
    attr_reader :id
    def initialize(appstore,id)
      @id=id
      @summary=""
      @appstore=appstore
    end  
    
    def getSummary
      @appstore.getSummary(self)
    end  
    
    def artWorkUrl
      @appstore.artWorkUrl(self)
    end
    
    def artistName
      @appstore.artistName(self)
    end
    
    def description
      @appstore.description(self)
    end
    
    def averageUserRating
      @appstore.averageUserRating(self)
    end
    
    def userRatingCount
      @appstore.userRatingCount(self)
    end
    
    def averageUserRatingForCurrentVersion
      #raise 'Abstract method called'
      @appstore.averageUserRatingForCurrentVersion(self)
    end
    
    def userRatingCountForCurrentVersion
      #raise 'Abstract method called'
      @appstore.userRatingCountForCurrentVersion(self)
    end
    
    def foundResult
      @appstore.foundResult(self) 
    end              
  end
  
  class AppleStoreSummary
    
    def getSummary(context)
      appId=context.id
      #appId=354539557
      if appId.is_a?Fixnum
        uri=URI.parse("https://itunes.apple.com/lookup?id=#{appId}")
      else
        uri=URI.encode("https://itunes.apple.com/search?term=#{appId}&entity=software,iPadSoftware")
        uri=URI.parse(uri)
      end  
      http= Net::HTTP.new(uri.host,uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      headers={
      }
      #r=http.request(Net::HTTP::Get.new(uri.request_uri))
      request=Net::HTTP::Get.new(uri.path+"?"+uri.query,headers)
      data=http.request(request)
      lookupdata=data.body
      context.summary=JSON.parse(lookupdata)
      return context.summary
      #p jsonLookupData["results"][0]["userRatingCount"]
    end
    
    def artWorkUrl(context)
      summary=context.summary
      if summary["results"][0].has_key?("artworkUrl60")
        return summary["results"][0]["artworkUrl60"]
      else
        return "NA"  
      end
    end
    
    def artistName(context)
      summary=context.summary
      if summary["results"][0].has_key?("artistName")
        return summary["results"][0]["artistName"]
      else
        return "NA"  
      end
    end
    
    def description(context)
      summary=context.summary
      if summary["results"][0].has_key?("description")
        return summary["results"][0]["description"]
      else
        return "NA"  
      end
    end
    
    def averageUserRating(context)
      summary=context.summary
      if summary["results"][0].has_key?("averageUserRating")
        return summary["results"][0]["averageUserRating"]
      else
        return "NA"  
      end
    end
    
    def userRatingCount(context)
      summary=context.summary
      if summary["results"][0].has_key?("userRatingCount")
        return summary["results"][0]["userRatingCount"]
      else
        return "NA"  
      end
    end
    
    def averageUserRatingForCurrentVersion(context)
      summary=context.summary
      if summary["results"][0].has_key?("averageUserRatingForCurrentVersion")
        return summary["results"][0]["averageUserRatingForCurrentVersion"]
      else
        return "NA"  
      end
    end
    
    def userRatingCountForCurrentVersion(context)
      summary=context.summary
      if summary["results"][0].has_key?("userRatingCountForCurrentVersion")
        return summary["results"][0]["userRatingCountForCurrentVersion"]
      else
        return "NA"  
      end
    end 
    
    def foundResult(context)
      summary=context.summary
      if (summary["resultCount"]!=0)
        return true
      else
        return false  
      end
    end    
  end    

  class GoogleStoreSummary
    def getSummary(context)
      p"Google Summary"
    end
  end  
end