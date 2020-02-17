require 'rspec'
require './lib/video_talks'

describe Scraper do
    it 'collects the presentation titles from the 2018 RubyKaigi' do
        expect(subject.scrape).to be_kind_of(Hash)
    end

    
end