require 'wombat'
require 'yaml'
require 'webmock'
require 'open-uri'
include WebMock::API

class Scraper 
    def scraper1(conference_name,url,path,talks_container,talk_title,speaker_name,speaker_github)
        Wombat.crawl do
            conference_name "#{conference_name}"
            base_url "#{url}"
            path "#{path}"
            talks "#{talks_container}", :iterator do 
                title "#{talk_title}"
                speaker "#{speaker_name}"
                github "#{speaker_github}"
                link ({xpath: ".//@href"}) 

                products  ({xpath: ".//@href"}), :follow do 
                    title 'css=h1'
              end
                                
            end
        end
    end
end

# Set the variables to be passed to the scraper
conference_name = 'RubyKaigi2017'
url = 'http://www.example.com'
path =  '/'
talks_container = 'css=.schedule-item'
talk_title = 'css=.schedule-item__title'
speaker_name = 'css=.schedule-item-speaker__name'
speaker_github = 'css=.schedule-item-speaker__id'

# REMOVE WEBMOCK WHEN USING LIVE. WebMock used to simulate a live website. For testing a locally saved html file is used to prevent scraping the real site many times
WebMock.enable!
stub_request(:get, "www.example.com").to_return(body: File.read(File.dirname(File.expand_path('..', __FILE__))+ "/test-data/RubyKaigi.htm"))

# Create a new scraper and pass the variables set earlier
scraper = Scraper.new
p scraper.scraper1(conference_name,url,path,talks_container,talk_title,speaker_name,speaker_github)
result = scraper.scraper1(conference_name,url,path,talks_container,talk_title,speaker_name,speaker_github)

# Save the scrped results to a YAML file, which will later be used by Jekyll to render onto a static page
File.open(File.dirname(File.expand_path('..', __FILE__)) + "/ruby-talks/_data/talks.yml", "w") { |file| file.write(result.to_yaml) }