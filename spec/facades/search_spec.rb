require 'rails_helper'

RSpec.describe SearchFacade do
  describe 'class methods' do
    it '.get_poems' do
      author_search = 'Emily'
      results = SearchFacade.get_poems(author_search)

      expect(results).to be_a Array
      expect(results.count).to be(10)
      expect(results.first).to be_a Poem
    end
  end
end
