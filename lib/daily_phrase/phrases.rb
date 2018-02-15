class DailyPhrase::Scrape
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
    # doc = Nokogiri::HTML(open("https://www.transparent.com/word-of-the-day/today/#{input}.html"))
    doc = Nokogiri::HTML(open("https://wotd.transparent.com/widget/?lang=italian&_ga=2.29169532.1350800894.1518714813-137452791.1518714813"))
    binding.pry

    phrase_scrape = "I am the phrase" #doc.css("p.js-wotd-fnphrase")
    translation_scrape = "I am the translation" #doc.css("p.js-wotd-enphrase")

    @@phrases[input.capitalize.to_sym][:phrase] = phrase_scrape
    @@phrases[input.capitalize.to_sym][:translation] = translation_scrape
  end


end
