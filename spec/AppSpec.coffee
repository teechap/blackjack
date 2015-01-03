assert = chai.assert

describe 'App', ->
  deck = null
  hand = null
  app = null

  beforeEach ->
    app = new App()
    hand = app.deck.dealPlayer()
    dealer = app.deck.dealDealer()

  describe 'hands', ->
    it 'should bust if over 21', ->
      hand.add(new Card
        rank: 10, suit: 0)
      hand.add(new Card
        rank: 10, suit: 1)
      hand.add(new Card
        rank: 10, suit: 2)
      assert.strictEqual hand.bust, true


