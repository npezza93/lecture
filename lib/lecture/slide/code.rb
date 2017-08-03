# frozen_string_literal: true

module Lecture
  class Slide
    class Code < Base
      def display
        Block.new(content: pygmentize_code(@content, lexer)).display
      end

      private

      def pygmentize_code(code, lexer)
        Pygments.highlight(
          code,
          formatter: "terminal16m", lexer: lexer,
          options: { style: Lecture.pygment_style }
        ).gsub("\e[39m", "\e[0m")
      end
    end
  end
end
