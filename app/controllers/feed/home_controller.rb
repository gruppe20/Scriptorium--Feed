require 'rss'

module Feed
  class HomeController < ApplicationController
    def index

      #Rails.cache.fetch("rss-list") do
      #  RSS::Parser.parse(open('http://www.gamer.no/feed/rss/').read, false).items[0..4]
      #end
      #Should get feeds from some storage, etc.
      get_feed#("http://www.gamer.no/feed/rss/")

    end

    

    def get_feed#(url)

      feed = RSS::Parser.parse(open('http://www.gamer.no/feed/rss/').read, false)
      @link = feed.channel.link
      @title = feed.channel.title
      @items = feed.channel.items[0..4] # just use the first five items
    end


  end
end
