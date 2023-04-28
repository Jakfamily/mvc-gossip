require_relative './view.rb' 
require_relative './gossip' 

class Controller
  attr_accessor :params # Définit un attribut pour stocker les paramètres

  def initialize() # Initialise la classe Controller avec une instance de View et de Gossip
    @view = View.new # Initialise une instance de View pour afficher les vues
    @all = Gossip.new("", "") # Initialise une instance de Gossip pour récupérer tous les potins de la base de données
  end

  def create_gossip() # Définit une méthode pour créer un nouveau potin
    params = @view.create_gossip # Affiche le formulaire pour créer un nouveau potin et récupère les paramètres
    gossip = Gossip.new(params[:author], params[:content]) # Crée un nouveau potin avec les paramètres récupérés
    gossip.save # Enregistre le nouveau potin dans le fichier CSV
  end

  def index_gossips() # Définit une méthode pour afficher tous les potins de la base de données
    @view.index_gossips(@all.all) # Récupère tous les potins de la base de données et les affiche avec la méthode index_gossips de la classe View
  end
end
