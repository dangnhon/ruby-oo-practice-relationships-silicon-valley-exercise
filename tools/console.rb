require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

facebook = Startup.new("facebook", "Mark Z", "facebook.com")
tesla = Startup.new("Tesla", "Elon Musk", "Tesla.com")
pied_piper = Startup.new("Pied Piper", "Richard Hendricks", "PiedPiper.com")
space_x = Startup.new("SpaceX", "Elon Musk", "spacex.com")

b1 = VentureCapitalist.new("Bart", 1000000000)
b2 = VentureCapitalist.new("Lisa", 1500000000) 
b3 = VentureCapitalist.new("Tim", 10000) 
b4 = VentureCapitalist.new("John", 10090) 

funding_round1 = FundingRound.new(facebook, b1, "SeriesA", 1) 
funding_round2 = FundingRound.new(facebook, b2, "SeriesB", 10007600)
funding_round3 = FundingRound.new(pied_piper, b2, "SeriesC", 1000990)
funding_round4 = FundingRound.new(facebook, b4, "SeriesD", 1) 

binding.pry
0 #leave this here to ensure binding.pry isn't the last line