module RaceForPresident
  module AllocateFunds
    attr_accessor :funds

    def add_funds(amount)
      @funds += amount
    end

    def remove_funds(amount)
      @funds -= amount
    end
  end
end