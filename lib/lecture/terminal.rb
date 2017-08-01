# frozen_string_literal: true

module Lecture
  module Terminal
    private

    def clear
      print "\e[2J\e[H"
    end

    def clear_and_exit(exit_status = 0)
      clear
      exit exit_status
    end

    def cols
      IO.console.winsize[1]
    end

    def getch
      prep_for_keyboard_entry do
        if (input = STDIN.getc.chr) == "\e"
          input << STDIN.read_nonblock(3) rescue nil
          input << STDIN.read_nonblock(2) rescue nil
        end

        input
      end
    end

    def lines
      IO.console.winsize[0]
    end

    def move_to(x, y)
      print "\033[#{y};#{x}H"
    end

    def prep_for_keyboard_entry
      begin
        STDIN.echo = false
        STDIN.raw!

        input = yield
      ensure
        STDIN.echo = true
        STDIN.cooked!
      end

      input
    end

    def print_line(line, x, y)
      move_to(x, y)
      tran_time = 0.3

      line.each_char do |c|
        print c
        sleep [tran_time / line.length, Lecture.character_print_delay].min
      end
    end
  end
end
