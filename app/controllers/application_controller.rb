class ApplicationController < ActionController::Base
  protect_from_forgery
  include StaticPagesHelper
  include SummaryReporterHelper
end
