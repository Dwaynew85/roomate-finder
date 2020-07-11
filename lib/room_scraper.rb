class RoomScraper
  index_url = "https://atlanta.craigslist.org/search/roo"

  def initialize(index_url)
    @doc = Nokogiri::HTML(open(index_url))
    binding.pry
  end


  def rows
    @rows ||= @doc.search("p.result-info")
  end
end
