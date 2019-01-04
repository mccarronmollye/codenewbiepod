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
      puts "#{i}. #{episode.title} - #{episode.guest} aired on #{episode.release_date}"
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter the Episode number you'd like more info on or type list to view all episodes. Type exit to exit."
      input = gets.strip.downcase

      if input.to_i > 0
        puts @episodes[input.to_i-1]
      elsif input == "list"
        list_episodes
      else
        puts "Invalid input, please retry."
      end
    end
  end

  def goodbye
    puts "Thanks for using my program!"
  end

end
