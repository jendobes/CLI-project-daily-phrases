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

  def greeting
    puts "Please type in the languages for which you would like to see phrases."
    sleep(0.5)
    puts "~To see a complete list of available languages, type 'list'."
    sleep(1)
    puts "~If you would like to phrases in all 15 languages, type 'all'."
    sleep(1)
    puts "~To exit the program, type 'quit'."
  end

  def continue
    puts "Would you like to see more phrases?"
    input = gets.strip.downcase
    if input == "yes"
      greeting
    else
      puts "Thanks for visiting us! Come back tomorrow for more phrases :)"
    end
  end

  def list
    puts <<-DOC.gsub /^\s+/, ""
    You can learn daily phrases in 15 languages; check 'em out below!
    French
    German
    Spanish
    Italian
    Swedish
    Portugese
    Dutch
    Norwegian
    Polish
    Chinese
    Arabic
    Hindi
    Russian
    Korean
    Japenese
    DOC
    sleep(3)
    menu
  end

  def greetings
    greetings = {
      French: "Bonjour!",
      German:  "Hallo!"
      Spanish: "Hola!"
      Italian: "Ciao!"
      Swedish: "Hej!"
      Portugese: "Hello!"
      Dutch: "Hello!"
      Norwegian: "Hello!"
      Polish: "Hello!"
      Chinese: "Hello!"
      Arabic: "Hello!"
      Hindi: "Hello!"
      Russian: "Hello!"
      Korean: "Hello!"
      Japenese: "Hello!"
    }

  end

  def menu #currently unable to handle multiple language input that is not separated by a comma
    greeting
    input = gets.strip
    array = input.split(", ")

    if input == "all"
      puts "Here's what people around the world are saying today:"
      puts "All 15 language phrases"
    elsif input == "list"
      list
    elsif input == "quit"
      exit
    elsif array.length == 1
      puts "Let's see what people are saying in #{input.capitalize} today:"
      input.split(", ").each{|language| puts "Phrase in #{language.capitalize}"}
      continue
    else
      new_array = array.collect{|language| language.capitalize}
      puts "Let's see what people are saying in #{new_array[0...new_array.length-1].join(", ")} and #{new_array[new_array.length-1]} today:"
      input.split(", ").each{|language| puts "Phrase in #{language.capitalize}"}
      continue
    end
  end

end
