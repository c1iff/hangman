require('rspec')
require('game')

describe(Game) do
  describe('#get_word') do
    it('returns a word from a preset list') do
      new_game = Game.new()
      new_game.set_word('cat')
      expect(new_game.get_word()).to(eq('cat'))
    end
  end

  describe('#word_length') do
    it('returns length of word') do
      new_game = Game.new()
      new_game.set_word('cat')
      expect(new_game.word_length()).to(eq(3))
    end
  end

  describe('#guess') do
    it('returns the index positions of matched letters') do
      new_game = Game.new()
      new_game.set_word('dogg')
      expect(new_game.guess('g')).to(eq([2, 3]))
    end
  end

  describe('#match?') do
    it('adds to miss counter if there is no match') do
      new_game = Game.new()
      new_game.set_word('dogg')
      expect(new_game.match?('x')).to(eq(1))
    end
  end
end
