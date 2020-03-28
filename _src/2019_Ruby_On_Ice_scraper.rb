require 'wombat'

class ScraperRubyOnIce2019
    
    def scrape

        Wombat.crawl do
            base_url "https://rubyonice.com/speakers"
            talk "xpath=(//a[contains(@href,'/speakers/')])", :follow do
                conference_name "Ruby On Ice 2019"
                speaker_name xpath: "//h3"
                speaker_bio "css=.muted"
                speaker_twitter xpath: "//a[@class='speaker-twitter-link']/@href"
                talk_title xpath: "//h2"
                talk_description xpath: "//p"
                talk_video "xpath=//iframe/@src"
            end
        end
    end
end
