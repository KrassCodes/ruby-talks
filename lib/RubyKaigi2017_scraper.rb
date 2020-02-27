require 'wombat'

class Scraper_RubyKaigi2017
    
    def scrape 
        #this data format is used to select the [row, cell, number of item to select]. E.g. [2, 1, 2] means 'select the data from row 2, cell 1, and the second item in the list of all items which are in second row and cell 1'. I.e. the first speaker on September 19.
        data = [[2, 1, 1], [4, 1, 1], [4, 2, 1], [4, 3, 1], [5, 1, 1], [5, 2, 1], [5, 3, 1], [6, 1, 1], [6, 2, 1], [6, 3, 1], [8, 1, 1], [8, 2, 1], [8, 3, 1], [9, 1, 1], [9, 2, 1], [9, 3, 1],
                [2, 1, 2], [3, 1, 2], [3, 2, 2], [3, 3, 2], [5, 1, 2], [3, 2, 2], [5, 3, 2], [6, 1, 2], [6, 2, 2], [6, 3, 2], [7, 1, 2], [7, 2, 2], [7, 3, 2], [9, 1, 2], [9, 2, 2], [9, 3, 2], [10, 1, 2], [10, 2, 2], [10, 3, 2],
                [2, 1, 3], [2, 2, 3], [2, 3, 3], [3, 1, 3], [3, 2, 3], [3, 3, 3], [5, 1, 3], [5, 2, 3], [5, 3, 3], [6, 1, 3], [6, 2, 3], [6, 3, 3], [7, 1, 3], [7, 2, 3], [7, 3, 3], [9, 1, 3], [9, 2, 3],  [9, 3, 3],  [10, 1, 3]]

        data.map do |data|

            xpath_string = "xpath=(//tbody/tr[#{data[0]}]//td[#{data[1]}]//a)[#{data[2]}]"

            Wombat.crawl do
                base_url "https://rubykaigi.org/2017/schedule/"
                talk "#{xpath_string}", :follow do
                    conference_name "RubyKaigi 2017"
                    speaker_name "css=.speaker__name"
                    speaker_bio "css=.speaker__bio"
                    talk_title "css=.presentation-content__title"
                    talk_description "css=.presentation-content__description"
                    talk_support_docs "css=.presentation-materials__list"
                    talk_video ""
                end
            end
        end    
    end
end
