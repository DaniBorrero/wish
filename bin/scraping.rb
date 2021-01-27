def scrap_page(url)
  require 'nokogiri'
  require 'open-uri'
  image_url = ''
  price = 5.2
  name = ''
  html = open(url).read
  doc = Nokogiri::HTML(html)
  doc.search('img.jsx-2487856160').map do |element|
    image_url = element.attr('src')
  end
  
  doc.search('.copy12').map do |element|
    price = element.inner_text.tr('$ .','').to_f
  end

  doc.search('.product-name').map do |element|
    name =  element.inner_text
  end
  return image_url, price, name
end