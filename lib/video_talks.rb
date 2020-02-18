require 'wombat'
require 'yaml'

class Scraper 

    include Wombat::Crawler

    base_url 'https://rubykaigi.org'

    path "/2017/schedule/#sep18"
    
    talks "css=.schedule-item__body", :iterator do
        title "css=.schedule-item__title"
        speaker "css=.schedule-item-speaker__name"
        github "css=.schedule-item-speaker__id"
    end
   
end

scraper = Scraper.new
p scraper.scrape
result = scraper.scrape

File.open("../ruby-talks/_data/talks.yml", "w") { |file| file.write(result.to_yaml) }