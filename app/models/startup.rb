require 'pry' 

class Startup

    attr_reader :founder
    attr_accessor :name, :domain

    @@all = [] 
    @@domain = [] 

    def initialize(name, founder, domain) 
        @name = name 
        @founder = founder
        @domain = domain
        @@all << self 
        @@domain << domain
    end 

    def pivot(domain, name)
        @domain = domain 
        @name = name
    end  

    def self.all 
        @@all
    end 

    def self.find_by_founder(founder) 
        self.all.find{|startup_instance| startup_instance.founder == founder} 
    end 

    def self.domains
        @@domain
    end 

    def sign_contract(venture_capitalist_object, investment_type, invested_amount) 
        FundingRound.new(self, investment_type, invested_amount)
    end 

    def num_funding_rounds 
        FundingRound.all.select{|rounds| rounds.startup == self}.length
    end 

    def total_funds 
        total_amount = []
        FundingRound.all.select do |rounds| 
           if rounds.startup == self
                total_amount << rounds.investment 
            end 
         end
         total_amount.sum
    end 

    def investors 
        investors_array = [] 
        FundingRound.all.each do |rounds| 
            if rounds.startup == self               
                investors_array << rounds.venture_capitalist.name
            end 
        end 
        investors_array.uniq
    end 

    def big_investors
        three_commas = []
        VentureCapitalist.tres_commas_club.each do |rich_person|
            i = 0
            while i < self.investors.length
                if rich_person.name == self.investors[i]
                    three_commas << rich_person.name
                end
                i += 1
            end
        end
        three_commas
    end

end 
