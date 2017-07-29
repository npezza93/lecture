# frozen_string_literal: true

module Lecture
  module Terminal
    def cols
      IO.console.winsize[1]
    end

    def lines
      IO.console.winsize[0]
    end

    def move_to(x, y)
      print "\033[#{y};#{x}H"
    end

    def clear
      puts "\e[2J\e[H"
    end

    def available_colors
      String.colors
    end

    def available_modes
      String.modes
    end

    def print_line(line, x, y)
      move_to(x, y)

      line.each_char do |c|
        print c
        sleep CHARACTER_PRINT_DELAY
      end
    end
  end
end
