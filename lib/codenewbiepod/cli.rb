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
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter the Episode number you'd like more info on or type list to view all episodes. Type exit to exit."
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on deal 1..."
      when "2"
        puts "More info on deal 2..."
      when "list"
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
