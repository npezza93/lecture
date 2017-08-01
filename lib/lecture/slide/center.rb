# frozen_string_literal: true

module Lecture
  class Slide
    class Center < Base
      def display
        content.each_line.with_index do |line, i|
          col = [1, 1 + (cols - line.chomp.uncolorize.length) / 2].max

          print_line(line, col, row + i)
        end
      end

      private

      def row
        @first_center_row ||= [1, 1 + (lines - content.count("\n")) / 2].max
      end
    end
  end
end
