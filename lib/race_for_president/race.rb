require_relative 'candidate'
require_relative 'donations'

module RaceForPresident
  class Race
    attr_reader :name
    attr_accessor :candidates

    def initialize(name)
      @name, @candidates = name.split.map(&:capitalize).join(' '), []
    end

    def add_candidate(candidate)
      @candidates << candidate
    end

    def rally(candidate)
      approval_rating = {
        1 => 1000,
        5 => 5000,
        10 => 10000,
        15 => 15000,
        20 => 20000
      }

      puts "\nDetermine how much money you want to spend on your rally. The more you spend, the more you improve your approval rating. "
      puts "AVAILABLE FUNDS: $#{candidate.funds}"
      puts

      answer = ''
      until ['1', '2', '3', '4', '5', 'q'].include? answer do
        approval_rating.each_with_index do | (k,v), index|
          print "Enter #{index+1} to spend $#{v} to achieve a boost in your approval rating by #{k}%.\n"
        end
        answer = gets.chomp
      end
      puts

      if answer == "1" && candidate.funds >= 1000
        candidate.approval_boost(1)
        candidate.remove_funds(1000)
      elsif answer == "2" && candidate.funds >= 5000
        candidate.approval_boost(5)
        candidate.remove_funds(5000)
      elsif answer == "3" && candidate.funds >= 10000
        candidate.approval_boost(10)
        candidate.remove_funds(10000)
      elsif answer == "4" && candidate.funds >= 15000
        candidate.approval_boost(15)
        candidate.remove_funds(15000)
      elsif answer == "5" && candidate.funds >= 20000
        candidate.approval_boost(20)
        candidate.remove_funds(20000)
      elsif answer == 'q'
        exit
      else
        puts "You do not have enough funds to hold a rally."
        puts "You forfeit your turn in punishment for getting your supporters hopes up."
      end
      puts
    end

    def fundraiser(candidate)
      donation = PossibleDonations::DONATIONS

      puts "\n#{candidate.name}'s' fundraiser has the chance to win one of #{donation.size} possible donations:"
      donation.each do |donation|
        puts "Donation amount: $#{donation.amount}"
      end
      puts

      chosen_donation = PossibleDonations.random
      candidate.add_funds(chosen_donation.amount)
      puts "\n\t#{candidate.name} just recieved a $#{chosen_donation.amount} donation!"
      puts
    end
  end
end


