class DailyPhrase::CLI

  def call
    puts "***Welcome to globoyak's Daily Language Phrases!!!***"
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
    puts <<-DOC.gsub /^\s+/, ""

    Please type in the languages for which you would like to see phrases.
    ~To see a complete list of available languages, type 'list'.
    ~If you would like to phrases in all 15 languages, type 'all'.
    ~To exit the program, type 'quit'.
    DOC

    input = gets.strip
    array = input.split(", ")

    if input == "all"
      puts "Here's what people around the world are saying today:"
      puts "All 15 language phrases"
    if input == "list"
      list
    elsif input == "quit"
      exit
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
