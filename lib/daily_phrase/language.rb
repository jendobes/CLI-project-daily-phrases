class DailyPhrase::Language
attr_accessor :name, :hello, :phrase, :translation

  @@all = []

  def initialize(name = nil)
    @name = name
    @@all << self
  end

  def self.add_attributes_to_languages
      @@all.each do |language|
      DailyPhrase::Scrape.scraper(language.name)
      language_key = DailyPhrase::Scrape.phrases[:"#{language.name.capitalize}"]
      language.add_phrases(language_key)
    end

  end

  def add_phrases(phrases_hash)
    phrases_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

end
