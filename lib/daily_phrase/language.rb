class DailyPhrase::Language
attr_accessor :name, :greeting, :phrase, :translation

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end


  def self.scraper(input)
      greetings = []
      doc = Nokogiri::HTML(open("http://pocketcultures.com/2008/10/30/say-hello-in-20-languages/"))
      # doc.search("p strong").each {|language| greetings << language}
      #   doc.search("p strong").text.split(/(\d.)/)

  end


end
