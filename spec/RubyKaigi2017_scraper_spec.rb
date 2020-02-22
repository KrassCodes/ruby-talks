require 'rspec'
require './lib/RubyKaigi2017_scraper'
require 'webmock/rspec'

describe Scraper_RubyKaigi2017 do
    WebMock.allow_net_connect!

    it 'collects the RubyKaigi 2017 conference name1' do        
        expect(subject.scrape).to include("conference_name" => "RubyKaigi 2017")
    end

    it 'collects the Keynote talk title, speaker name and github name of speaker' do       
        expected = {
            "conference_name" => "RubyKaigi 2017",
            "talks" => a_hash_including("github"=>"@n0kada", "speaker"=>"nobu", "title"=>"Keynote")
        }
        expect(subject.scrape).to include(expected)
    end


end