require_relative '2019_Ruby_On_Ice_scraper'
require_relative '2019_Brighton_Ruby_scraper'
require_relative '2018_Brighton_Ruby_scraper'
require 'yaml'


# 2019 Ruby on Ice 

    rubyOnIce2019Scraper = ScraperRubyOnIce2019.new
    resultRubyOnIce2019 = rubyOnIce2019Scraper.scrape
    File.open(File.dirname(File.expand_path('..', __FILE__)) + "/_data/master_talks_list.yml", "w") { |file| file.write(resultRubyOnIce2019.to_yaml.gsub("---\ntalk:\n", '')) }

# 2019 Brighton Ruby 

    brightonRuby2019Scraper = ScraperBrightonRuby2019.new()
    resultBrightonRuby2019 = brightonRuby2019Scraper.scrape
    resultBrightonRuby2019["talk"].uniq!
    File.open(File.dirname(File.expand_path('..', __FILE__)) + "/_data/master_talks_list.yml", "a") { |file| file.write(resultBrightonRuby2019.to_yaml.gsub("---\ntalk:\n", '')) }

# 2018 Brighton Ruby 

    brightonRuby2018Scraper = ScraperBrightonRuby2018.new()
    resultBrightonRuby2018 = brightonRuby2018Scraper.scrape
    resultBrightonRuby2018["talk"].uniq!
    File.open(File.dirname(File.expand_path('..', __FILE__)) + "/_data/master_talks_list.yml", "a") { |file| file.write(resultBrightonRuby2018.to_yaml.gsub("---\ntalk:\n", '')) }

    