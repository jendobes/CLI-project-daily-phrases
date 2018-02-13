#!/usr/bin/env ruby
# require "./lib/daily_phrase.rb"
# require 'pry'
# require 'nokogiri'
# require 'open-uri'
class DailyPhrase::Phrases
#:French => {hello: "Bonjour!", lang_phrase: "Je m'appelle Jennifer", eng_phrase: "my name is Jennifer"}
attr_accessor :phrases

  def self.phrases
    @@phrases
  end

  @@phrases = {
    :French => {hello: "Bonjour!"},
    :German => {hello:  "Hallo!"},
    :Spanish => {hello: "¡Hola!"},
    :Italian => {hello: "Ciao!"},
    :Swedish => {hello: "Hallå!"},
    :Portugese => {hello: "Olá!"},
    :Dutch => {hello: "Hallo!"},
    :Norwegian => {hello: "Hallo!"},
    :Polish => {hello: "Witaj!"},
    :Chinese => {hello: "你好 (Nǐ hǎo)!"},
    :Arabic => {hello: "مرحبا (marhba)!"},
    :Hindi => {hello: "नमस्कार (namaskaar)!"},
    :Russian => {hello: "Здравствуйте (Zdravstvuyte)!"},
    :Korean => {hello: "여보세요 (yeoboseyo)!"},
    :Japenese => {hello: "こんにちは (Kon'nichiwa)!"}
  }

  def self.scraper(input)
    doc = Nokogiri::HTML(open("https://www.transparent.com/word-of-the-day/today/#{input}.html"))
    # # binding.pry
    # # scrape lang_phrase
    # lang_scrape = "Mi chiamo Jennifer" # scrape lang_phrase
    # @@phrases[input.capitalize.to_sym][:lang_phrase] = lang_scrape
    # # doc.css
    # #
    # eng_scrape = "My name is Jennifer" # scrape eng_phrase
    # @@phrases[input.capitalize.to_sym][:eng_phrase] = eng_scrape
    #
    # puts "#{@@phrases[input.capitalize.to_sym][:lang_phrase]} is #{input.capitalize} for #{@@phrases[input.capitalize.to_sym][:eng_phrase]}"
    current_language = DailyPhrase::Language.all.detect{|language| langage.name == input}
    current_language.phrase = "phrase scraper"
    current_language.translate = "translate scraper"
  end


end
