 class Codenewbiepod::Episode

   attr_accessor :title, :guest, :release_date, :url

   def self.all
     self.scrape_episodes
     # episode_1 = self.new
     # episode_1.title = "From nanny to developer"
     # episode_1.guest = "Sudie Roweton"
     # episode_1.release_date = "November 26, 2018"
     # episode_1.url = "https://www.codenewbie.org/podcast/from-nanny-to-developer"
     #
     # episode_2 = self.new
     # episode_2.title = "How do I learn design?"
     # episode_2.guest = "Laura Elizabeth"
     # episode_2.release_date = "November 19, 2018"
     # episode_2.url = "https://www.codenewbie.org/podcast/how-do-i-learn-design"
     #
     # [episode_1, episode_2]
   end

   def self.scrape_episodes
     episodes = []
      episodes << self.scrape_codenewbie
     episodes
   end

   def self.scrape_codenewbie
     doc = Nokogiri::HTML(open("https://www.codenewbie.org/podcast"))

     episode = self.new
     episode.title = doc.search("h3.episode--info--title").text
     episode.guest = doc.search("span.episode--info--meta-data--guest-name").text
     episode.release_date = doc.search("span.episode--info--meta-data--published-on").text
     #url  = doc.search("a.podcasts-list--grid-item--link").attr("href")
     #episodes
     episode

   end


 end
