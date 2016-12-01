class Game
 @@words = ['dog', 'cat', 'goat']

  define_method(:initialize) do
    @current_word = @@words.sample()
    @match_counter = 0
    @miss_counter = 0
    @spaces = []
  end

  define_method(:get_word) do
    @current_word
  end

  define_method(:set_word) do |word|
    @current_word = word
  end

  define_method(:word_length) do
    @current_word.length
  end

  define_method(:guess) do |guessed|
    letters_array = @current_word.split('')
    current_matches = letters_array.each_index.select {|i| letters_array[i] == guessed}
    @match_counter += current_matches.length


    current_matches.each do |index|
      @spaces.slice!(index)
      @spaces.insert(index, guessed)
    end

    current_matches
  end

  define_method(:get_spaces) do
    @spaces.join(" ")
  end

  define_method(:match?) do |guessed|
    if @current_word.include?(guessed)
    else
      @miss_counter += 1
    end
  end

  define_method(:game_over?) do
    if @match_counter == @current_word.length
      "winner"
    elsif @miss_counter == 6
      "loser"
    else
      "keep playing"
    end
  end

  define_method(:get_word_spaces) do

    @current_word.length.times do
      @spaces.push("_")
    end
    @spaces.join(" ")
  end

  define_method(:get_miss_count) do
    @miss_counter
  end

end
