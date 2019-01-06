#Our CLI Controller
class Codenewbiepod::CLI

  def call
    puts "List of Codenewbie Epsisodes:"
    list_episodes
    menu
    goodbye
  end


  def list_episodes
    @episodes = Codenewbiepod::Episode.all
    @episodes.each.with_index(1) do |episode, i|
      puts "#{i}. \"#{episode.title}\"\n With #{episode.guest} aired on #{episode.release_date}"
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter the episode number to retrieve the URL for a given episode, or type list to view all episodes. Type exit to exit."
      input = gets.strip.downcase

      if input.to_i > 0
        puts "Episode link: " + @episodes[input.to_i-1].url + "\n Happy listening!"
      elsif input == "list"
        list_episodes
      elsif input == "exit"
      else
        puts "Invalid input, please retry."
      end

    end
  end

  def goodbye
    puts "Thanks for using my program!"
  end

end
