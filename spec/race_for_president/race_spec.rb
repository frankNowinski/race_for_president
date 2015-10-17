require'../../lib/race_for_president/race'

module RaceForPresident
  describe Race do
    before do 
      @race = Race.new("the presidential race")
    end

    it "capitalizes each charachter of the name" do
      expect(@race.name).to eq "The Presidential Race"
    end

    it "adds candidate to race" do 
      candidate = Candidate.new("bernie")
      @race.add_candidate(candidate)

      expect(@race.candidates).not_to be_empty
    end
  end
end