require_relative '../lib/race_for_president/race'

bernie = RaceForPresident::Candidate.new("Bernie")
hillary = RaceForPresident::Candidate.new("Hillary")

race_for_president = RaceForPresident::Race.new("The Presidential Race")

race_for_president.add_candidate(bernie)
race_for_president.add_candidate(hillary)

@players = [bernie, hillary]

@current_player_indice = 0
def current_player 
  return @players[@current_player_indice]
end

def next_player
  @current_player_indice = (@current_player_indice+1) % @players.size
end

elected_president = false
while !elected_president
  answer = ''
  until ['f', 'r', 'q'].include? answer do
    puts "\nEnter 'f' to hold a fundraising event and gain money.\nEnter 'r' to hold a rally and gain popularity.\nEnter 'q' to quit."
    puts "\n#{current_player.name}'s turn: "
    puts "Current funds: $#{current_player.funds}"
    puts "Current popularity: #{current_player.approval_rating}%"
    answer = gets.chomp.downcase
  end
  
  case answer
  when'f'
    race_for_president.fundraiser(current_player)
    current_player.print
  when 'r'
    race_for_president.rally(current_player)
    current_player.print
    if current_player.president? 
      puts "Congratulations #{current_player.name}! You are elected to be the 45th president of the United States!"
      puts 
      puts "Game over"
      break
    end
  when 'q'
    exit
  end
  current_player = next_player
end
