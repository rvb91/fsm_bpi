require_relative './fsm.rb'

RSpec.describe do
  describe "given examples" do
    it 'return 0 for input sequence 110' do
      expect(calculator("110")).to eq(0)
    end

    it 'return 1 for input sequence 1010' do
      expect(calculator("1010")).to eq(1)
    end
  end


  # State transition table is as follows:
  # Current state | Input | Result state
  # S0            | 0     | S0
  # S0            | 1     | S1
  # S1            | 0     | S2
  # S1            | 1     | S0
  # S2            | 0     | S1
  # S2            | 1     | S2
  describe "fsm" do
    it "return S0  for input 0 and current state S0" do
      expect(fsm(:S0, "0")).to eq(:S0)
    end
    it "return S1  for input 1 and current state S0" do
      expect(fsm(:S1, "1")).to eq(:S0)
    end
    it "return S2  for input 0 and current state S1" do
      expect(fsm(:S2, "0")).to eq(:S1)
    end
    it "return S0  for input 1 and current state S1" do
      expect(fsm(:S0, "1")).to eq(:S1)
    end
    it "return S1  for input 0 and current state S2" do
      expect(fsm(:S1, "0")).to eq(:S2)
    end
    it "return S2  for input 1 and current state S2" do
      expect(fsm(:S2, "1")).to eq(:S2)
    end  
  end
end