require "stringio"
require_relative "./game"

# Fix the random number generator so it always produces the same sequence.
srand 1

# Get expected output.
expected_output = File.read("sample_game.txt")

# Redirect stdout.
$stdout = StringIO.new

# Play the game!
Game.play

# Retreive stdout.
actual_output = $stdout.string

# Reset stdout.
$stdout = STDOUT

# Compare output with expect output.
if actual_output == expected_output
  puts "Output was as expected"
  exit 0
else
  puts "Output was not as expected"
  exit 1
end
