 class Codenewbiepod::Episode

   def self.all
     #return all episodes
     puts <<-DOC.gsub /^\s*/, ''
           1. Guest A
           2. Guest B
     DOC

     episode_1 = self.new
     episode_1.title = "From nanny to developer"
     episode_1.guest = "Sudie Roweton"
     episode_1.release_date = "November 26, 2018"
     episode_1.url = "https://www.codenewbie.org/podcast/from-nanny-to-developer"

     episode_2 = self.new
     episode_2.title = "How do I learn design?"
     episode_2.guest = "Laura Elizabeth"
     episode_2.release_date = "November 19, 2018"
     episode_2.url = "https://www.codenewbie.org/podcast/how-do-i-learn-design"
   end

 end
