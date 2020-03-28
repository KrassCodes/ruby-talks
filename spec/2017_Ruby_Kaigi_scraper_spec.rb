require 'rspec'
require '../_src/2017_Ruby_Kaigi_scraper'
require 'webmock/rspec'

describe ScraperRubyKaigi2017 do
    WebMock.allow_net_connect!

    it 'collects the speaker name, bio, talk title,talk description, link to supporting docs', :vcr do       
        expected = {
            "talk" => a_hash_including(
                "conference_name"=>"RubyKaigi 2017",
                "speaker_bio"=>"The patch monster",
                 "speaker_name"=>"nobu",
                 "talk_description"=>"Nobu's keynote speech",
                 "talk_support_docs"=>"Making Ruby? ゆるふわRuby生活",
                 "talk_title"=>"Keynote",
                 "talk_video"=>"https://www.youtube.com/watch?v=Bt-PvFLbMbU")
        }
            expect(subject.scrape).to include(expected)
    end
end