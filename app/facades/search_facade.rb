class SearchFacade
  def self.get_poems(author_search)
    poems = SearchService.poems_by_author(author_search)
    poems.map do |poem|
      tone = ToneService.tone_analyzer(poem[:lines].join(", "))
      Poem.new(poem, tone)
    end
  end
end
