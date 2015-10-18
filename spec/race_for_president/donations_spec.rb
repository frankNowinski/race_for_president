require'../../lib/race_for_president/donations'

module RaceForPresident
  describe Donation do
    before do 
      @donation = Donation.new(1000)
    end

    it "has an amount attribute" do 
      expect(@donation.amount).to eq 1000
    end
  end

  describe PossibleDonations do
    it "has six donations" do 
      expect(PossibleDonations::DONATIONS.size).to eq 6
    end

    it "has a donation in the amount of $1000" do 
      expect(PossibleDonations::DONATIONS[0]).to eq Donation.new(1000)
    end

    it "has a donation in the amount of $2000" do 
      expect(PossibleDonations::DONATIONS[1]).to eq Donation.new(2000)
    end

    it "has a donation in the amount of $3000" do 
      expect(PossibleDonations::DONATIONS[2]).to eq Donation.new(4000)
    end

    it "has a donation in the amount of $4000" do 
      expect(PossibleDonations::DONATIONS[3]).to eq Donation.new(6000)
    end

    it "has a donation in the amount of $6000" do 
      expect(PossibleDonations::DONATIONS[4]).to eq Donation.new(8000)
    end

    it "has a donation in the amount of $8000" do 
      expect(PossibleDonations::DONATIONS[5]).to eq Donation.new(12000)
    end

    it "returns a random donation" do 
      donation = PossibleDonations.random

      expect(PossibleDonations::DONATIONS).to include(donation)
    end
  end
end