class Poem
  attr_reader :title, :author, :poem_line, :tones
  def initialize(poem, tones)
    @title = poem[:title]
    @author = poem[:author]
    @poem_line = poem[:lines].join(", ")
    @tones = get_tone_names(tones[:tones])
  end

  def get_tone_names(tones)
    set = []
    tones.each do |tone|
      set << tone[:tone_name]
    end
    set.join(", ")
  end
end
