
class DailyPhrase::CLI

  def list
    DailyPhrase::Phrases.phrases.each{|key, value| puts key}
    sleep(1.5)
    menu
  end

  # def validate(input)
  #   #validates that language is available
  # array = input.split(", ")
  # array.each{|language| DailyPhrase::Phrases.phrases.include?(language)}
  # end

  def input_prep(input)
    input.include?(",") ? preped_input = input : preped_input = input.split(" ").join(", ")
    preped_input
  end

  def create_languages(array)
    # array = input_prep(input).split(", ")
    array.each{|language| language = DailyPhrase::Language.new(language)}
    DailyPhrase::Language.add_attributes_to_languages
  end

  def create_all_languages
  end


  def menu
    greeting
    input = gets.strip
    array = input_prep(input).split(", ")

    if input == "all"
      puts "Here's what people around the world are saying today:"
      puts "All 15 language phrases"
      create_all_languages
    elsif input == "list"
      list
    elsif input == "quit"
      exit
    elsif array.length == 1
      create_languages(array)
      puts "#{DailyPhrase::Phrases.phrases[input.capitalize.to_sym][:hello]} Let's see what people are saying in #{input.capitalize} today:"
      # input.split(", ").each{|language| puts "Phrase in #{language.capitalize}"}

    else
      create_languages(array)
      new_array = array.collect{|language| language.name.capitalize}
      puts "#{DailyPhrase::Phrases.phrases[new_array.first.to_sym][:hello]} Let's see what people are saying in #{new_array[0...new_array.length-1].join(", ")} and #{new_array[new_array.length-1]} today:"
      # input.split(", ").each{|language| puts "Phrase in #{language.capitalize}"}
    end

    DailyPhrase::Language.all.each do |language|
      puts language.phrase
      puts language.translation
    end
    DailyPhrase::Language.clear
    continue
  end

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

end
