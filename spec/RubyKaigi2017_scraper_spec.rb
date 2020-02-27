require 'rspec'
require './lib/RubyKaigi2017_scraper'
require 'webmock/rspec'


describe Scraper_RubyKaigi2017 do

    it 'collects the speaker name, bio, talk title,talk description, link to supporting docs', :vcr do       
        expected = {
            "talk" => a_hash_including(
                "conference_name"=>"RubyKaigi 2017",
                "speaker_bio"=>"The patch monster",
                 "speaker_name"=>"nobu",
                 "talk_description"=>"Nobu's keynote speech",
                 "talk_support_docs"=>"Making Ruby? ゆるふわRuby生活",
                 "talk_title"=>"Keynote",
                 "talk_video"=>"")
        }
            expect(subject.scrape).to include(expected)
    end
end