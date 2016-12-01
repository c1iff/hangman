require('sinatra')
require('sinatra/reloader')
require('./lib/game')
also_reload('lib/**/*.rb')

get('/') do
  @@new_game = Game.new()
  @misses = @@new_game.get_miss_count()
  @@new_game.get_word_spaces()
  @word = @@new_game.get_spaces()
  erb(:index)
end

post('/') do
  @@new_game.guess(params.fetch('guess'))
  @@new_game.match?(params.fetch('guess'))
  # @new_game.game_over?()
  @misses = @@new_game.get_miss_count()
  @word = @@new_game.get_spaces()
  erb(:index)
end
