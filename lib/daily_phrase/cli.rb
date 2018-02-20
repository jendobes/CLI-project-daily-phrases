
class DailyPhrase::CLI
  attr_reader :offered_langs

  def initialize
    @offered_langs = DailyPhrase::Scrape.phrases.collect{|key, value| key.to_s}
  end

  def list
    puts "-----------------------".colorize(:cyan)
    puts "Here are all available languages:"
    @offered_langs.each{|language| puts language}
    sleep(0.5)
    menu
  end

  def validate(input)
    array = input_prep(input).collect{|language| language.capitalize}
    if !(array - @offered_langs).empty?
      puts "-----------------------".colorize(:cyan)
      puts "Hmmm I didn't understand that.."
      menu
    end
  end

  def input_prep(input)
    input.include?(",") ? preped_input = input : preped_input = input.split(" ").join(", ")
    preped_input.split(", ")
  end

  def create_languages(input)
    input_prep(input).each{|language| language = DailyPhrase::Language.new(language)}
    DailyPhrase::Language.add_attributes_to_languages
  end

  def create_all_languages
    @offered_langs.each{|language| language = DailyPhrase::Language.new(language)}
    DailyPhrase::Language.add_attributes_to_languages
  end


  def menu
    greeting
    input = gets.strip

    if input == "all"
      puts "Here's what people around the world are saying today:"
      create_all_languages
    elsif input == "list"
      list
    elsif input == "exit"
      puts "-----------------------".colorize(:cyan)
      puts "Thanks for visiting us! Come back tomorrow for more phrases :)"
      exit
    else
      validate(input)
      create_languages(input)
    end

      puts "-----------------------".colorize(:cyan)
      DailyPhrase::Language.all.each do |language|
      puts language.hello
      puts "Let's see what people are saying in #{language.name.capitalize} today:"
      puts language.phrase.colorize(:magenta)
      puts "In English, this means:"
      puts language.translation.colorize(:blue)
      puts "-----------------------".colorize(:cyan)
    end

    DailyPhrase::Language.clear
    continue
  end


  def call
    puts "***Welcome to Daily Language Phrases!!!***".colorize( :background => :light_cyan)
    menu
  end


  def greeting
    puts "-----------------------".colorize(:cyan)
    puts "Please type in the languages for which you would like to see phrases."
    puts "~To see a list of available languages, type 'list'."
    puts "~To see phrases in all 15 languages, type 'all'."
    puts "~To exit the program, type 'exit'."
    puts "-----------------------".colorize(:cyan)
  end


  def continue
    puts "Would you like to see more phrases?"
    input = gets.strip.downcase
    if input == "yes"
      menu
    elsif input == "no"
      puts "Thanks for visiting us! Come back tomorrow for more phrases :)"
      exit
    else
      puts "-----------------------".colorize(:cyan)
      puts "Please type 'yes' or 'no'"
      continue
    end
  end

end
