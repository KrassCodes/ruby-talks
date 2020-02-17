require 'wombat'

class Scraper 

    include Wombat::Crawler

    base_url 'https://rubykaigi.org'

    path "/2017/schedule/#sep18"
    
    gems do
        list "css=.schedule-item__title", :list
    end

end

scraper = Scraper.new
p scraper.scrape

