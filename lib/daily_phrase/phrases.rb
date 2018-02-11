require "nokogiri"
require "open-uri"
require "pry"
#class DailyPhrase:Phrases

class Phrases

  def self.scrape(url)
    phrase_page = Nokogiri::HTML(open(url))

  end

  def greetings
    @greetings
  end

#:French => {hello: "Bonjour!", lang_phrase: "Je m'appelle Jennifer", eng_phrase: "my name is Jennifer"}
    @greetings = {
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
binding.pry
