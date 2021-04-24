class Post < ApplicationRecord
	@name = 'vehicles_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    puts @start_urls.inspect
    
  end

  def parse(response, url:, data: {})
    response.xpath("//div[@class='main']").each do |vehicle|
      item = {}

      puts item.inspect
    end
  end
end
