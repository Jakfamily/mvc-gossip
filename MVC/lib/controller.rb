require_relative './view.rb'
require_relative './gossip'


require_relative './gossip'
require_relative './view'

class Controller
  attr_accessor:params

  def initialize()
  @view=View.new
  @all =Gossip.new("","")
  end
  
  def create_gossip()
    params=@view.create_gossip
    gossip = Gossip.new(params[:author], params[:content])
    #pour le moment, le contenu de ce gossip est inscrit "en dur" dans le code. L'utilisateur ne peut pas le changer.
    gossip.save
  end

  def index_gossips 
    @view.index_gossips(@all.all)
  end
end