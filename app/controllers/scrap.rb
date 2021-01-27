require 'nokogiri'
require 'open-uri'

class Scrap
  def self.scrap_page(url)
    image_url = ''
    price = 5.2
    name = ''
    html = open(url).read
    doc = Nokogiri::HTML(html)
    doc.search('img.jsx-2487856160').map do |element|
      image_url = element.attr('src')
    end
    
    doc.search('.copy12').map do |element|
      puts element.inner_text
      price = 3.2
    end
  
    doc.search('.product-name').map do |element|
      name =  element.inner_text
    end
    return name
  end
end