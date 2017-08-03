# frozen_string_literal: true

module Lecture
  class Slide
    class Section < Base
      def display
        Center.new(content: content_with_bars).display
      end

      private

      def content_with_bars
        half_count_of_dashes = [1, (max_col_length - 3)].max / 2
        dashes = "─" * half_count_of_dashes

        "#{dashes} § #{dashes}\n\n#{content}\n\n#{dashes} § #{dashes}"
      end

      def max_col_length
        content.each_line.map do |line|
          line.chomp.uncolorize.length
        end.max
      end
    end
  end
end
