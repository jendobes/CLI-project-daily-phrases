
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

  def create_languages(input)
    lang_array = input_prep(input).split(", ")
    lang_array.each{|language| language = DailyPhrase::Language.new(language)}
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
    else
      create_languages(input)
    end

      puts "-----------------------"
      DailyPhrase::Language.all.each do |language|
      puts language.hello
      puts "Let's see what people are saying in #{language.name.capitalize} today:"
      puts language.phrase
      puts language.translation
      puts "-----------------------"
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
    puts "~To see a complete list of available languages, type 'list'."
    puts "~If you would like to phrases in all 15 languages, type 'all'."
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
