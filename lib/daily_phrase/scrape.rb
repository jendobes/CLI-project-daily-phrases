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
    :Portuguese => {hello: "Olá!"},
    :Dutch => {hello: "Hallo!"},
    :Norwegian => {hello: "Hallo!"},
    :Polish => {hello: "Witaj!"},
    :Chinese => {hello: "你好 (Nǐ hǎo)!"},
    :Arabic => {hello: "مرحبا (marhba)!"},
    :Hindi => {hello: "नमस्कार (namaskaar)!"},
    :Russian => {hello: "Здравствуйте (Zdravstvuyte)!"},
    :Korean => {hello: "여보세요 (yeoboseyo)!"},
    :Japanese => {hello: "こんにちは (Kon'nichiwa)!"}
  }

  def self.scraper(input)
    browser = Watir::Browser.new :chrome
    browser.goto "https://www.transparent.com/word-of-the-day/today/#{input}.html"
    browser.driver.switch_to.frame(0)
    doc = Nokogiri::HTML.parse(browser.html)

    phrase_scrape = doc.css("p.js-wotd-fnphrase").text
    translation_scrape = doc.css("p.js-wotd-enphrase").text
    browser.driver.quit

    @@phrases[input.capitalize.to_sym][:phrase] = phrase_scrape
    @@phrases[input.capitalize.to_sym][:translation] = translation_scrape
  end


end
