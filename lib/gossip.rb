require 'csv' # Charge le module CSV pour lire et écrire des fichiers CSV

class Gossip
  attr_reader :author, :content # Définit des attributs en lecture seule pour l'auteur et le contenu d'un potin

  def initialize(author, content) # Initialise la classe Gossip avec un auteur et un contenu
    @content = content # Stocke le contenu du potin
    @author = author # Stocke l'auteur du potin 
  end

  def all # Définit une méthode qui va récupérer tous les potins de la base de données et les afficher
    gossip_author = [] # Initialise un tableau vide pour stocker les auteurs des potins
    gossip_content = [] # Initialise un tableau vide pour stocker les contenus des potins
    csv = CSV.read("db/gossip.csv") # Ouvre le fichier CSV contenant les potins dans le dossier db
    csv.each do |row| # Parcourt chaque ligne du fichier CSV
      gossip_author << row[0] # Ajoute l'auteur du potin à la liste des auteurs
      gossip_content << row[1] # Ajoute le contenu du potin à la liste des contenus
    end
    puts all_gossips = Hash[gossip_author.zip(gossip_content)] # Crée un hash avec les auteurs et les contenus des potins et l'affiche
  end

  def save() # Définit une méthode pour enregistrer un nouveau potin dans le fichier CSV
    CSV.open("db/gossip.csv", "a") do |csv| # Ouvre le fichier CSV en mode append
      csv << [author, content] # Ajoute une nouvelle ligne avec l'auteur et le contenu du potin
    end
  end
end
