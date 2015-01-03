# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    deal = =>
      phand = @get 'playerHand'
      console.log(phand)
      phand.on 'add remove change', =>
        console.log(@get("playerHand").scores())
        score = @get("playerHand").scores()[1]
        if score > 21
          score = @get("playerHand").scores()[0]
          if score > 21
            console.log("playbust about to happen")
            @.trigger("playerbust")
      dhand = @get 'dealerHand'
      dhand.on 'add remove change', =>
        console.log(@get("dealerHand").scores())
        score = @get("dealerHand").scores()[1]
        if score > 21
          score = @get("dealerHand").scores()[0]
          if score > 21
            @.trigger("dealerbust")
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @.on("playerbust", =>
      console.log("player bust") #check bust in view
      #@set 'deck', deck = new Deck()
      @set 'playerHand', deck.dealPlayer()
      deal()

      @set 'dealerHand', deck.dealDealer())

    @.on("dealerbust", -> console.log("dealer bust")) #check bust in view


    deal()

      # score = get 2nd value of scores
      #   if score > 21
      #     score = get 1st value of scores
      # if score is > 21, bust
