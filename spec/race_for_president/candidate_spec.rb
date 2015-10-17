require'../../lib/race_for_president/candidate'

module RaceForPresident
  describe Candidate do
    before do 
      @candidate = Candidate.new("frank")
      $stdout = StringIO.new
    end

    it "has a capitalized name" do
      expect(@candidate.name).to eq "Frank"
    end

    it "starts with a default fund of $1000" do
      expect(@candidate.funds).to eq 1000
    end

    it "starts with a popularity of 0" do
      expect(@candidate.popularity).to eq 0
    end

    it "adds money to funds" do 
      @candidate.add_funds(1000)

      expect(@candidate.funds).to eq 2000
    end

    it "removes money from funds" do 
      @candidate.remove_funds(1000)

      expect(@candidate.funds).to eq 0
    end

    it "adds popularity" do 
      @candidate.popularity_boost(10)

      expect(@candidate.popularity).to eq 10
    end
  end
end
