# Fruit Salad

`game.rb` contains simple code for a game of noughts and crosses.  When you run
`ruby game.rb` from your command line, you should see output from two AI
players who pick a move at random.

However, lots of the names in the code have been exchanged for names of fruit.
This doesn't matter to the computer, but it makes it very hard for a human to
work out what's going on.

Exercise: refactor `game.rb` so that it communicates its intent to a human
reader.

Note that there's a file, `test_game.rb`, that tests the implementation of
`game.rb`.  As you refactor `game.rb`, you should regularly run `ruby
test_game.rb` to make sure that `game.rb` continues to work.
