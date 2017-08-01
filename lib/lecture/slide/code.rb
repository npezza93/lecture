# frozen_string_literal: true

module Lecture
  class Slide
    class Code < Base
      def display
        content.each_line.with_index do |line, i|
          print_line(line, col, row + i)
        end
      end

      private

      def col
        [1, 1 + (cols - content.each_line.map do |line|
          line.chomp.uncolorize.length
        end.max) / 2].max
      end

      def content
        pygmentize_code(@content, lexer)
      end

      def pygmentize_code(code, lexer)
        Pygments.highlight(
          code,
          formatter: "terminal16m", lexer: lexer,
          options: { style: Lecture.pygment_style }
        ).gsub("\e[39m", "\e[0m")
      end

      def row
        [1, 1 + (lines - content.count("\n")) / 2].max
      end
    end
  end
end
