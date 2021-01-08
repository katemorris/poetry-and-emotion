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
        expect(page).to have_content('Title: Not at Home to Callers')
        expect(page).to have_content('Author: Emily Dickinson')
        expect(page).to have_content('Poem: Not at Home to Callers, Says the Naked Tree --, Bonnet due in April --, Wishing you Good Day --')
        expect(page).to have_content('Tone: Sad')
      end
    end
  end
end
