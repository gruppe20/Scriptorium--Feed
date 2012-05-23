require 'rss'

module Feed
  class HomeController < ApplicationController
    def index
      #Rss.create(:url => 'http://slashdot.org/slashdot.rss')
      @feeds = Rss.all
    end

  end
end
