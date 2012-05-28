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
          hash = {item: item, parent: feed}
          @sorted_items << hash
        end
        #Sort items by date, newest to oldest
        @sorted_items = @sorted_items.sort_by{ |item| item[:item].date }.reverse
      end

    end
  end
end
