module StoryParserConcern

  PARSER = TactfulTokenizer::Model.new
  extend self

  ## Public API

  # "foo\n\nbar" -> [ "foo", "bar" ]
  def to_paragraphs(body)
    without_line_breaks = ignore_unnecessary_line_breaks body
    paragraphs = split_body_to_paragraphs without_line_breaks
    paragraphs = remove_blank_spaces paragraphs
  end

  def to_sentences(paragraph)
    PARSER.tokenize_text(paragraph)
  end

  # ---

  ## Private API

  def remove_blank_spaces(paragraphs)
    paragraphs.reject {|line| line.blank?}
  end

  def ignore_unnecessary_line_breaks(text)
    punctuation = [".", "?", "!", '"']
    text = text.split("")
    text = text.map.with_index do |char, index|
      if char == "\n" && !punctuation.include?(text[index - 1])
        " "
      else
        char
      end
    end
    text.join("")
  end

  def split_body_to_paragraphs(body)
    body.split /[\r\n]+/
  end

end