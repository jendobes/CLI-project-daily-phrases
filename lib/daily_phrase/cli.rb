class DailyPhrase::CLI

  def call
    puts "Welcome to globoyak's Daily Phrases!"
    menu
    # list_phrases

  end

  # def list_phrases
  #   puts <<-DOC.gsub /^\s+/, ""
  #   [language greeting]! Let's see what people are saying in (languages) today:
  #   (lists phrases)
  #   DOC

  # end

  def menu #currently unable to handle multiple language input that is not separated by a comma
    puts "Please indicate which languages you would like to see, or enter 'all'"
    input = gets.strip
    array = input.split(", ")
    if input == "all"
      puts "Here's what people around the world are saying today:"
      puts "All 15 language phrases"
    elsif array.length == 1
      puts "Let's see what people are saying in #{input.capitalize} today:"
      input.split(", ").each{|language| puts "Phrase in #{language.capitalize}"}
      else
        new_array = array.collect{|language| language.capitalize}
        puts "Let's see what people are saying in #{new_array[0...new_array.length-1].join(", ")} and #{new_array[new_array.length-1]} today:"
        input.split(", ").each{|language| puts "Phrase in #{language.capitalize}"}
        end
  end

end
