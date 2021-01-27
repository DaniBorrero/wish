require 'mechanize'
require 'csv'
require 'pry-byebug'

# Instantiate a new web scraper with Mechanize
scraper = Mechanize.new

# Mechanize setup to rate limit your scraping 
# to once every half-second.  
# THIS IS IMPORTANT OR YOU WILL BE IP BANNED!
scraper.history_added = Proc.new { sleep 0.5 }

# hard-coding an address for your scraper
ADDRESS = 'http://sfbay.craigslist.org/search/sfc/apa'

# Set up an array to store all of our results
results = []

# Make the first row of the array the column names
results << ['Name', 'URL', 'Price', 'Location']

# SCRAPING TIME!!!!
scraper.get(ADDRESS) do |search_page|

  # Use Mechanize to enter search terms into the form fields
  form = search_page.form_with(:id => 'searchform') do |search|

    search['query'] = 'Garden'
    search['min_price'] = 250
    search['max_price'] = 1500
  end
  result_page = form.submit   

  # Get results
  raw_results = result_page.search('p.row')

  # Parse results
  raw_results.each do |result|
    link = result.css('a')[1]
    name = link.text.strip
    url = "http://sfbay.craigslist.org" + link.attributes["href"].value
    price = result.search('span.price').text
    location = result.search('span.pnr').text[3..-13]

    puts location

    # Save results
    results << [name, url, price, location]
  end
end
CSV.open("filename.csv", "w+") do |csv_file|
  results.each do |row|
    csv_file << row
  end
end