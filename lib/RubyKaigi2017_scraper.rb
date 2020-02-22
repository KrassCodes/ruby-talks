require 'wombat'
require 'yaml'
require 'webmock'
include WebMock::API

class Scraper_RubyKaigi2017
    
    def scrape

        # WebMock used to simulate a live website. For testing a locally saved html file is used to prevent scraping the real site many times
        WebMock.enable!
        stub_request(:get, "www.example.com").to_return(body: File.read(File.dirname(File.expand_path('..', __FILE__))+ "/test-data/RubyKaigi.htm"))
    
        Wombat.crawl do
            #base_url to be changed to https://rubykaigi.org/ when live. Placehodler URL used for testing with Webmock
            base_url "http://www.example.com"
            #path to be changed to /2017/schedule/ when live
            path "/"
            conference_name "css=.header__title"

            talks "css=.schedule-item", :iterator do 
                title "css=.schedule-item__title"
                speaker "css=.schedule-item-speaker__name"
                github "css=.schedule-item-speaker__id"
            end
        end
    end
end
