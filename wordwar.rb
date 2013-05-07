class Wordwar
  def initialize
    @dictionary = File.read('/usr/share/dict/words').downcase.split
    @prefixes = ['ni', 'ne', 'fr', 'fu', 'dr', 'da', 'tr', 'wa', 'ta', 'ca', 
                 'cr', 'ma', 'mo', 'sl', 'si', 'sh', 'so', 'ri', 'pr', 'pu',
                 'ki', 'kn', 'ea', 'por', 'pra', 'tru', 'pri', 'med', 'ord']
    @score = 0
    begin_game
    play_game
    end_game
  end
  
  def begin_game
    puts "Play by completing ten words with the prefixes given."
    puts "For example, if you see 'ca' you could make a word like 'cat.'"
  end
  
  def play_game
    start_time = Time.now
    
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
    
    end_time = Time.now
    @total_time = (end_time - start_time).round(1)
  end
  
  def end_game
    puts "You have made #{@score} words out of ten in #{@total_time} seconds."
  end
end

Wordwar.new
