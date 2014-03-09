require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    before {visit root_path}
    #let(:heading) {'Mobile App Review'}
    #let(:page_title) {''}
    it "should have the title 'Mobile App Review'" do
      #visit '/static_pages/home'
      page.should have_selector('title',:text=>'Mobile App Review')
    end
   end 
end
