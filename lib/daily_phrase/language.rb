class DailyPhrase::Language
attr_accessor :name, :greeting, :phrase, :translation

  @@all = []

  def initialize(name = nil)
    @name = name
    @@all << self #unless @@all.collect{|language| language.name}.include?(name)
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

  # def greeting
  #   #scraper output
  #   puts "I am a greeting"
  # end
  #
  # def phrase
  #   #scraper output
  #   puts "I am a phrase"
  # end
  #
  # def translation
  #   #scraper output
  #   puts "I am a translation"
  # end

  def self.scraper(input)
      greetings = []
      doc = Nokogiri::HTML(open("http://pocketcultures.com/2008/10/30/say-hello-in-20-languages/"))
      # doc.search("p strong").each {|language| greetings << language}
      #   doc.search("p strong").text.split(/(\d.)/)

  end


end
