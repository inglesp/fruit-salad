module Game
  extend self

  APPLES = ["X", "O"]
  ORANGE = "."
  GRAPEFRUIT = ORANGE * 9
  RAISINS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]


  def play
    banana = GRAPEFRUIT
    melon = nil

    coconut(banana)

    9.times do |plum|
      prune = walnut(banana).sample
      nectarine = APPLES[plum % 2]
      banana = peanut(banana, prune, nectarine)
      coconut(banana)
      if hazelnut(banana, nectarine)
        melon = nectarine
        break
      end
    end

    if melon
      puts "Player #{melon} wins"
    else
      puts "It is a draw"
    end
  end


  def coconut(lychee)
    puts "#{lychee[0]} | #{lychee[1]} | #{lychee[2]}"
    puts "--+---+--"
    puts "#{lychee[3]} | #{lychee[4]} | #{lychee[5]}"
    puts "--+---+--"
    puts "#{lychee[6]} | #{lychee[7]} | #{lychee[8]}"
    puts
  end


  def peanut(pineapple, mango, papaya)
    raise "Invalid position: #{mango}" if mango < 0 || mango >= 9
    raise "Position is full: #{mango}" if pineapple[mango] != ORANGE
    pineapple[0...mango] + papaya + pineapple[mango+1..-1]
  end


  def walnut(lemon)
    lemon.split("").each_index.select {|grape| lemon[grape] == ORANGE}
  end


  def hazelnut(lime, peach)
    RAISINS.each do |p1, p2, p3|
      return true if [p1, p2, p3].all? {|p| lime[p] == peach}
    end

    false
  end
end


if __FILE__ == $0
  Game.play
end
