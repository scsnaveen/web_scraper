require 'kimurai'
class PostData < Kimurai::Base
  @name = 'post_data'
  @engine = :mechanize
  @config = {
    user_agent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36",
    # before_request: { delay: 4..7 }
  }

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    puts "******************"
    @post_detail = PostDetail.new
    @post_detail.post_id = Post.last.id
      @post_detail.title =[]
    response.xpath("//h3[@class= 'LC20lb DKV0Md']").each do |a|
      # puts a.children[0].text.inspect
      # val = vehicle.children[2].children[0].children.children.children.children.children[0].

      # puts "----------------------"
      @post_detail.title << a.children[0].text
      # puts item[:title].inspect
      # puts "---------------------"
      # Post.where(item).first_or_create
    end
    response.xpath("//cite[@class= 'iUh30 Zu0yb qLRx3b tjvcx']").each do |a|
      # puts a.children[0].text.inspect
     @post_detail.link_value << a.children[0].text
    end
    @post_detail.save

  end
end