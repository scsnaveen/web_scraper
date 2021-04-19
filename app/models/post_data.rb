require 'kimurai'

class PostData < Kimurai::Base
  @name = 'post_data'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    puts "******************"
    puts response.xpath("//body//div[@id= 'GyAeWb']").inspect
    response.xpath("//body").each do |vehicle|
      puts vehicle.inspect
      # puts "+++++++++++"
      # puts vehicle.inspect
      # puts "***********@@@@@@@@"
      val = vehicle.children[2].children[0].children.children.children.children.children[0].attributes
      puts val.inspect
      puts "+++++++++++"
      item = {}
 puts "----------------------"
      # item[:title]      = vehicle.html('yuRUbf')
      puts "title name"
      puts item[:title].inspect
      puts "---------------------"
      # item[:price]      = vehicle.css('span.listing-row__price')&.text&.squish&.delete('^0-9').to_i
      # item[:drivetrain]   = vehicle.css('ul.listing-row__meta li')[3]&.text&.squish.gsub('Drivetrain: ', '')
      puts item.inspect

      Post.where(item).first_or_create
    end
  end
end