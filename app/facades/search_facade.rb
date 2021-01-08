class SearchFacade
  def self.get_poems(author_search)
    poems = SearchService.poems_by_author(author_search)
    poems[0..9].map do |poem|
      tones = ToneService.tone_analyzer(poem[:lines].join(", "))
      Poem.new(poem, tones)
    end
  end
end
