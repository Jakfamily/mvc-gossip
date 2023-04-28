require 'csv'
class Gossip
  attr_reader :author,:content,:array
  
  def initialize(author, content)
    @content = content
    @author = author
     
  end

  def all
    gossip_author= []
    gossip_content = []
    csv = CSV.read("db/gossip.csv") 
    csv.each do |row|
      gossip_author <<row[0] 
      gossip_content << row[1]
    end     
      puts all_gossips= Hash[gossip_author.zip(gossip_content)]
  end

  def save()
      CSV.open("db/gossip.csv", "a") do |csv|
          csv <<[@author,@content]   
      end  
  end
end
