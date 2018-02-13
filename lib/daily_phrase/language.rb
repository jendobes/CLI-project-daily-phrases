class DailyPhrase::Language
  def self.scraper(input)
      greetings = []
      doc = Nokogiri::HTML(open("http://pocketcultures.com/2008/10/30/say-hello-in-20-languages/"))
      # doc.search("p strong").each {|language| greetings << language}
      #   doc.search("p strong").text.split(/(\d.)/)

  end
  

end
