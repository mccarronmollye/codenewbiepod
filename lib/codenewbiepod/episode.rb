require 'pry'

 class Codenewbiepod::Episode

   attr_accessor :title, :guest, :release_date, :url

   def initialize(title:, guest:, release_date:, url:)
     @title = title
     @guest = guest
     @release_date = release_date
     @url = url
   end

   def self.all
      @@all ||= self.scrape_episodes.collect do |episode_hash|  #check if we have a class variable all otherwise it will scrape (so we're not scraping each time all is called)
      self.new(episode_hash)
      end
    end



   def self.scrape_most_recent_episode #need to add most recent episode to episode list
     doc = Nokogiri::HTML(open("https://www.codenewbie.org/podcast"))

     doc.css('.podcasts-featured__content').collect do |episode|
       #binding.pry
       {
         title: episode.css("span.episode-header__podcast_name").text.strip,
         guest: episode.css("span.episode-header__guest_name").text.strip,
         release_date: episode.css("span.episode-header__date").text.strip,
         #url: episode.css("a.podcasts-list--grid-item--link").first.attr("href")
         url: "https://www.codenewbie.org/podcast/#{episode.css("h3.episode--info--title").text.strip.downcase.gsub(/[^a-z0-9\s]/i, '').gsub(" ", "-")}"
       }
     end

   end


   def self.scrape_episodes
     doc = Nokogiri::HTML(open("https://www.codenewbie.org/podcast"))

     doc.css('.podcasts-list--grid-item').collect do |episode|
       #binding.pry
       {
         title: episode.css("h3.episode--info--title").text.strip,
         guest: episode.css("span.episode--info--meta-data--guest-name").text.strip,
         release_date: episode.css("span.episode--info--meta-data--published-on").text.strip,
         #url: episode.css("a.podcasts-list--grid-item--link").first.attr("href") -- this was not working with my ruby version
         url: "https://www.codenewbie.org/podcast/#{episode.css("h3.episode--info--title").text.strip.downcase.gsub(/[^a-z0-9\s]/i, '').gsub(" ", "-")}"
       }
     end
   end

 end
