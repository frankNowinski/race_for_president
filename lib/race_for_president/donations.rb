module RaceForPresident

  Donation = Struct.new(:amount)

  module PossibleDonations
    DONATIONS = [
      Donation.new(1000),
      Donation.new(2000),
      Donation.new(4000),
      Donation.new(6000),
      Donation.new(8000),
      Donation.new(12000)
    ]

    def self.random
      DONATIONS.sample
    end
  end
end