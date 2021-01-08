require 'rails_helper'

describe "As a User" do
  describe  "when I visit home" do
    it "I can search for poems and see many with their tones" do
      visit root_path

      fill_in :author, with: 'Emily'
      click_on 'Get Poems'

      expect(current_path).to eq('/search')
      expect(page).to have_css('.poem', count: 10)
      within ('#poem-1') do
        expect(page).to have_content('Title: Defrauded I a Butterfly --')
        expect(page).to have_content('by Emily Dickinson')
        expect(page).to have_content('Poem: Defrauded I a Butterfly --, The lawful Heir -- for Thee --')
        expect(page).to have_content('Tone: Joy')
      end
    end
  end
end
