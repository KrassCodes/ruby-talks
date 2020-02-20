require 'rspec'
require './lib/video_talks'

describe Scraper do

    it 'scrapes the presentation titles from the 2017 RubyKaigi page' do
        conference_name = 'RubyKaigi2017'
        url = 'http://www.example.com'
        path =  '/'
        talks_container = 'css=.schedule-item'
        talk_title = 'css=.schedule-item__title'
        speaker_name = 'css=.schedule-item-speaker__name'
        speaker_github = 'css=.schedule-item-speaker__id'
        
        expect(subject.scraper1(conference_name,url,path,talks_container,talk_title,speaker_name,speaker_github)).to include("conference_name" => "RubyKaigi2017")
    end

end