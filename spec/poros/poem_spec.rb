require 'rails_helper'

RSpec.describe Poem do
  it 'exists' do
      poem_data = {
        :title=>"Not at Home to Callers",
        :author=>"Emily Dickinson",
        :lines=>["Not at Home to Callers", "Says the Naked Tree --", "Bonnet due in April --", "Wishing you Good Day --"],
        :linecount=>"4"
      }
      tones = {:tones=>[{:score=>0.730959, :tone_id=>"joy", :tone_name=>"Joy"}]}
      poem = Poem.new(poem_data, tones)
      expect(poem).to be_a Poem
      expect(poem.title).to eq('Not at Home to Callers')
      expect(poem.author).to eq('Emily Dickinson')
      expect(poem.poem_line).to eq('Not at Home to Callers, Says the Naked Tree --, Bonnet due in April --, Wishing you Good Day --')
      expect(poem.tones).to eq('Joy')
  end

  describe 'instance methods' do
    it '#get_tone_names()' do
      tones = [:tones, [{:score=>0.730959, :tone_id=>"joy", :tone_name=>"Joy"}]]

      expect(poem.get_tone_names(tones)).to eq(['Joy'])
    end
  end
end
