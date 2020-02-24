require 'wombat'

class Scraper_RubyKaigi2017
    
    def scrape
        
        Wombat.crawl do
            base_url "https://rubykaigi.org"
            path "/2017/schedule/"
            conference_name "css=.header__title"
            talks "css=.schedule-item", :iterator do 
                title "css=.schedule-item__title"
                speaker "css=.schedule-item-speaker__name"
                github "css=.schedule-item-speaker__id"
            end
        end
    end
end
