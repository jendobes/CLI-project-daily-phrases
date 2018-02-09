class DailyPhrase::CLI

  def call
    puts "Welcome to globoyak's Daily Phrases!
Please indicate which languages you would like to see, or enter 'all'"
  end

  def list_phrases
    puts <<-DOC
    [language greeting]! Let's see what people are saying in (languages) today:
    (lists phrases)
    DOC

  end



end
