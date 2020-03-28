require 'rspec'
require '../_src/2019_Ruby_On_Ice_scraper'
require 'webmock/rspec'

describe ScraperRubyOnIce2019 do
    WebMock.allow_net_connect!

    it 'collects speaker information from the Ruby On Ice Page', :vcr do
        expected = {
            "talk" => array_including(
                a_hash_including(
                    "conference_name" => "Ruby On Ice 2019", 
                    "speaker_twitter" => "https://twitter.com/eileencodes", 
                    "talk_title" => "The Past, Present, and Future of Rails at GitHub", 
                    "talk_description" => "On August 15, 2018 GitHub accomplished a great feat: upgrading our application from Rails 3.2 to 5.2. While this upgrade took a difficult year and a half your upgrade doesn't need to be this hard. In this talk we'll look at ways in which our upgrade was uniquely hard, how we accomplished this monumental task, and what we're doing to prevent hard upgrades in the future. We'll take a deep dive into why we upgraded Rails and our plans for upstreaming features from the GitHub application into the Rails framework.", 
            )   )
        }
        expect(subject.scrape).to include(expected)

    end




end
