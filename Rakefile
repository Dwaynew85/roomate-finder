require_relative './config/environment.rb'

def reload!
  load_all './lib'
end

task :console do
  Pry.start
end

task :scrape_rooms do
  # instantiate a scraper, and then have it find new rooms
  atl_scraper = RoomScraper.new('https://atlanta.craigslist.org/search/roo').update_rooms
  # atl_scraper.call
  # nyc_scraper = RoomScraper.new('https://newyork.craigslist.org/search/roo').update_rooms
  # chicago_scraper.call
  # after this method call, I should be able to say Room.all and have rooms there.
end
