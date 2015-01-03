# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @.on("bust", -> console.log("hello world")) #check bust in view
    phand = @get 'playerHand'
    phand.on 'add remove change', =>
      console.log(@get("playerHand").scores())
      score = @get("playerHand").scores()[1]
      if score > 21
        score = @get("playerHand").scores()[0]
        if score > 21
          @.trigger("bust")

    # score = get 2nd value of scores
    #   if score > 21
    #     score = get 1st value of scores
    # if score is > 21, bust
