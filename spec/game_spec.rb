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

  describe('#game_over?') do
    it('check if winning condition is met') do
      new_game = Game.new()
      new_game.set_word('dogg')
      new_game.guess('g')
      new_game.guess('d')
      new_game.guess('o')
      expect(new_game.game_over?()).to(eq('winner'))
    end
  end

  describe('#game_over?') do
    it('check if winning condition is met') do
      new_game = Game.new()
      new_game.set_word('dogg')
      6.times do
        new_game.match?('x')
      end
      expect(new_game.game_over?()).to(eq('loser'))
    end
  end

  describe('#get_word_spaces') do
    it('it returns an array with the current words letter\'s replaces with spaces') do
      new_game = Game.new()
      new_game.set_word('dogg')
      expect(new_game.get_word_spaces()).to(eq("_ _ _ _"))
    end
  end

  describe('#get_spaces') do
    it('shows current condition of word') do
      new_game = Game.new()
      new_game.set_word('cat')
      new_game.get_word_spaces()
      new_game.guess('c')
      expect(new_game.get_spaces()).to(eq('c _ _'))
    end
  end



end
