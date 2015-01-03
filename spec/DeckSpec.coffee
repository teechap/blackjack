assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    xit 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      #this might not work because add in .hit might return the whole hand?
      assert.strictEqual deck.length, 49
    it 'should add a card to the hand', ->
      assert.strictEqual hand.length, 2
      hand.hit();
      assert.strictEqual hand.length, 3

  describe 'last', ->
    it 'should report the last card', ->
      assert.strictEqual deck.last(), deck.models[deck.models.length-1]

  describe 'empty deck', ->
    it 'should not do hit if deck is empty', ->
      for num in [0..50]
        deck.pop()
      hand.hit()
      assert.strictEqual hand.length, 2

  describe 'stand', ->
    it 'should not change the hand', ->
      hand.stand()
      assert.strictEqual hand.length, 2
    it 'should call scores of hand', ->
      scoresCalled = sinon.spy(hand, 'scores')
      hand.stand()
      assert(scoresCalled.called)
