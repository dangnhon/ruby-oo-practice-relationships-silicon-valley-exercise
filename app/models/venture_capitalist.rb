require 'pry' 

class VentureCapitalist
    attr_reader :name 
    attr_accessor :total_worth

    @@all = [] 

    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth
        @@all << self
    end 

    def self.all
        @@all
    end 

    def self.tres_commas_club
        self.all.select{|rich_people| rich_people.total_worth >= 1000000000}
    end 

    def offer_contract(startup_object, type_of_investment, amount_float) 
        FundingRound.new(startup_object, self, type_of_investment, amount_float)
    end 

    def funding_rounds
        FundingRound.all.select{|rounds| rounds.venture_capitalist == self}
    end 

    def portfolio
        investing_array = [] 
        FundingRound.all.each do |rounds| 
            if rounds.venture_capitalist == self               
                investing_array << rounds.startup
            end 
        end 
        investing_array.uniq
    end 

    def biggest_investment
        balling_money = nil
        max_investment = 0
        FundingRound.all.each do |rounds|
            i = 0
            while i < self.portfolio.length
                if rounds.startup == self.portfolio[i]
                    if rounds.investment > max_investment
                        max_investment = rounds.investment
                        balling_money = rounds.itself
                        #binding.pry
                    end
                end
                i += 1
            end
        end
        balling_money
    end

    def invested(domain_string)
        highest_invested = 0 
        Startup.all.select do |starts| 
            if starts.domain == domain_string
                FundingRound.all.each do |rounds|
                    if rounds.startup.name == starts.name
                highest_invested += rounds.investment
                    end 
                end 
            end 
        end 
       highest_invested
    end 

end
