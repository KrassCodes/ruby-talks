require 'wombat'

class ScraperBrightonRuby2018

    def scrape

        Wombat.crawl do
            base_url "https://brightonruby.com/2018/"
            talk "xpath=(//a[contains(@href,'/2018/')])", :follow do
                conference_name "Brighton Ruby 2018"
                speaker_name "css=.mb-0"
                speaker_bio "css=.col-md-9"
                speaker_twitter "xpath=(//a[contains(@href,'twitter')]/@href)"
                talk_title "xpath=(/html/head/meta[@property='og:title']/@content)"
                talk_description "xpath=(/html/head/meta[@property='og:description']/@content)"
                talk_video "https://brightonruby.com/2018/"
            end
        end
    end
end

