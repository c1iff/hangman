class Game
 @@words = ['dog', 'cat', 'goat']

  define_method(:initialize) do
    @current_word = @@words.sample()
    @miss_counter = 0
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
  letters_array.each_index.select{|i| letters_array[i] == guessed}
end

define_method(:match?) do |guessed|
 if @current_word.include?(guessed)
 else 
  @miss_counter += 1
 end
end


end
