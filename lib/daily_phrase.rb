require "./lib/daily_phrase/version"
require "./lib/daily_phrase/cli"
require "./lib/daily_phrase/phrases"
require "nokogiri"
require "open-uri"
require "pry"
module DailyPhrase

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
  end
end
