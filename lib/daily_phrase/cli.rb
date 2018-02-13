
class DailyPhrase::CLI

  def call
    puts "***Welcome to globoyak's Daily Language Phrases!!!***"
    menu
  end

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
      menu
    elsif input == "no"
      puts "Thanks for visiting us! Come back tomorrow for more phrases :)"
    else puts "Please type 'yes' or 'no'"
      continue
    end
  end

  def list
    DailyPhrase::Phrases.phrases.each{|key, value| puts key}
    sleep(1.5)
    menu
  end

  def create_languages(input)
    array = input.split(", ")
    array.each{|language| language = DailyPhrase::Language.new(language)}
    DailyPhrase::Language.all
    binding.pry
  end

  def menu #currently unable to handle multiple language input that is not separated by a comma
    greeting
    input = gets.strip
    create_languages(input)
    if input == "all"
      puts "Here's what people around the world are saying today:"
      puts "All 15 language phrases"
      DailyPhrase::Phrases.phrases.each {|key, value| DailyPhrase::Phrases.scraper(key)}
    elsif input == "list"
      list
    elsif input == "quit"
      exit
    elsif DailyPhrase::Language.all.length == 1
      puts "#{DailyPhrase::Phrases.phrases[input.capitalize.to_sym][:hello]} Let's see what people are saying in #{input.capitalize} today:"
      # input.split(", ").each{|language| puts "Phrase in #{language.capitalize}"}
      input.phrase
      input.translation
    else
      new_array = DailyPhrase::Language.all.collect{|language| language.capitalize}
      puts "#{DailyPhrase::Phrases.phrases[new_array.first.to_sym][:hello]} Let's see what people are saying in #{new_array[0...new_array.length-1].join(", ")} and #{new_array[new_array.length-1]} today:"
      # input.split(", ").each{|language| puts "Phrase in #{language.capitalize}"}
      array.each {|language| language.phrase language.translation}
    end
    continue
  end

end
