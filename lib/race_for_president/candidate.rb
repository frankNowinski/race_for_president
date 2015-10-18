require_relative 'allocate_funds'

module RaceForPresident
  class Candidate
    include AllocateFunds

    attr_reader :approval_rating
    attr_accessor :name, :funds

    def initialize(name, funds=1000, popularity=0)
      @name, @funds, @approval_rating = name.capitalize, funds, popularity
    end

    def approval_boost(num)
      @approval_rating += num
      puts "\n#{@name}'s approval rating went up by #{num} point#{num == 1 ? '' : 's'}!"
    end

    def president?
      @approval_rating >= 100
    end

    def print
      funds_print = "#{@name}'s current funds".ljust(35, '.')
      approval_print = "#{@name}'s approval rating".ljust(38, '.')

      puts "#{funds_print} $#{@funds}"
      puts "-".ljust(42, '-')
      puts "#{approval_print} #{@approval_rating}%"
      puts
    end
  end
end