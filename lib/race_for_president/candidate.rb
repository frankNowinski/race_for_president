require_relative 'allocate_funds'

module RaceForPresident
  class Candidate
    include AllocateFunds

    attr_reader :popularity
    attr_accessor :name, :funds

    def initialize(name, funds=1000, popularity=0)
      @name, @funds, @popularity = name.capitalize, funds, popularity
    end

    def popularity_boost(num)
      @popularity += num
      puts "\n#{@name}'s popularity rating when up by #{num} point#{num == 1 ? '' : 's'}!"
    end

    def president?
      @popularity >= 100
    end

    def print
      funds_print = "#{@name}'s current funds".ljust(35, '.')
      popularity_print = "#{@name}'s popularity rating".ljust(38, '.')

      puts "#{funds_print} $#{@funds}"
      puts "-".ljust(42, '-')
      puts "#{popularity_print} #{@popularity}%"
      puts
    end
  end
end