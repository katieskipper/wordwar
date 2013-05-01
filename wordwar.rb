class Wordwar
  def initialize
    @dictionary = File.read('/usr/share/dict/words').split
    @prefixes = ['dr', 'da', 'tr', 'ta', 'ca', 'cr', 'ma', 'mo', 'sl', 'si', 'sh', 'so', 'ri', 'pr', 'pu']
    @score = 0
    begin_game
    play_game
    end_game
  end
  
  def begin_game
    puts "Play by completing ten words."
  end
  
  def play_game
    10.times do
      prefix = @prefixes.sample
      print prefix
      word = "#{prefix}#{gets.chomp}"
      found = @dictionary.include? word
      if found
        puts ':)'
        @score += 1
      else
        puts ':('
      end
    end
  end
  
  def end_game
    puts "You have made #{@score} words out of ten."
  end
end

Wordwar.new
