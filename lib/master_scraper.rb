require_relative 'RubyKaigi2017_scraper'

# RubyKaigi 2017 Section

    scraper_RubyKaigi2017 = Scraper_RubyKaigi2017.new
    result = scraper_RubyKaigi2017.scrape

    # Save the scrped results to a YAML file, which will later be used by Jekyll to render onto a static page
    File.open(File.dirname(File.expand_path('..', __FILE__)) + "/ruby-talks/_data/talks.yml", "w") { |file| file.write(result.to_yaml) }


# More conferences to be added below
