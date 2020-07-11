class RoomScraper
  index_url = "https://atlanta.craigslist.org/search/roo"

  def initialize(index_url)
    @index_url = index_url
    @doc = Nokogiri::HTML(open(index_url))
  end

  def call
    rows.each do |row_doc|
      Room.create_from_hash(scrape_row(row_doc)) #=> Should put the room in my database
    end
  end

  private
  def rows
    @rows ||= @doc.search("p.result-info")
  end

  def scrape_row(row)
    # scrape an individual row and return a hash
    {
    :date_created => row.search("time").first.attributes["datetime"].text,
    :title => row.search("a.hdrlnk").text,
    :url => row.search("a.hdrlnk").attribute("href").text,
    :price => row.search("span.result-price").text,
    }
  end

end
