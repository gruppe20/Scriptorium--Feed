module Feed
  module HomeHelper
  
    def get_feed(url)
      feed = RSS::Parser.parse(open(url).read, false)
      @link = feed.channel.link
      @title = feed.channel.title
      @items = feed.items[0..4] # just use the five latest items
    end

    def get_feeds
      @sorted_items = []
      @feeds.each do |feed|
        feed = RSS::Parser.parse(open(feed.url).read, false)
        feed.items[0..4].each do |item|
          @sorted_items << item
        end

        #Sort items by date, newest to oldest
        @sorted_items = @sorted_items.sort_by{ |item| item.date}.reverse

        puts "========================ITEMS==========================="
        puts @sorted_items
      end

    end
  end
end
