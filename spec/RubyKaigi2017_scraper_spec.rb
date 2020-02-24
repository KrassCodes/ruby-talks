require 'rspec'
require './lib/RubyKaigi2017_scraper'
require 'webmock/rspec'


describe Scraper_RubyKaigi2017 do

    it 'collects the RubyKaigi 2017 conference name', :vcr do       
            expect(subject.scrape).to include("conference_name" => "RubyKaigi 2017")
    end

    it 'collects the Keynote talk title, speaker name and github name of speaker', :vcr do     
        expected = {
            "conference_name" => "RubyKaigi 2017",
            "talks" => a_hash_including("github"=>"@n0kada", "speaker"=>"nobu", "title"=>"Keynote")
        }
            expect(subject.scrape).to include(expected)
    end
end