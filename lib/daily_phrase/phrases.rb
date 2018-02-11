require "nokogiri"
require "open-uri"

class DailyPhrase:Phrases

  def self.scrape(url)
    phrase_page = Nokogiri::HTML(open(url))

  end

  def lang_phrases
    greetings = {
      :French => {hello: "Bonjour!", phrase: },
      :German => {hello:  "Hallo!", phrase: },
      :Spanish => {hello: "¡Hola!", phrase: },
      :Italian => {hello: "Ciao!", phrase: },
      :Swedish => {hello: "Hallå!", phrase: },
      :Portugese => {hello: "Olá!", phrase: },
      :Dutch => {hello: "Hallo!", phrase: },
      :Norwegian => {hello: "Hallo!", phrase: },
      :Polish => {hello: "Witaj!", phrase: },
      :Chinese => {hello: "你好 (Nǐ hǎo)!", phrase: },
      :Arabic => {hello: "مرحبا (marhba)!", phrase: },
      :Hindi => {hello: "नमस्कार (namaskaar)!", phrase: },
      :Russian => {hello: "Здравствуйте (Zdravstvuyte)!", phrase: },
      :Korean => {hello: "여보세요 (yeoboseyo)!", phrase: },
      :Japenese => {hello: "こんにちは (Kon'nichiwa)!", phrase: },
    }
  end


end
