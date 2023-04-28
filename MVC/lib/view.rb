class View
  def create_gossip
    puts "\nTu as choisi de créer un potin.\n\n"
    puts "Quel est ton nom?"
    author = gets.chomp
    puts "Quel est ton potin?"
    content = gets.chomp
    puts "\n"
    return params = {content:"#{content}",author:"#{author}"}
  end
  def index_gossips(all)
    
  puts all.inspect
  end
end