# frozen_string_literal: true

module Lecture
  class Runner
    include Terminal

    Lecture.slide_types.each do |format|
      define_method(format) do |slide_content, **options, &block|
        slides.push(
          Slide.new(content: slide_content, format: format, **options)
        )
        block.call if block.present?
      end
    end

    attr_accessor :current_slide, :slides, :deck

    def initialize(deck)
      @current_slide = 0
      @slides        = []
      @deck          = deck
    end

    def execute
      instance_eval(File.read(deck))
      first_slide

      loop do
        command_handler
      end
    end

    def configure
      yield(Config.new)
    end

    private

    def command_handler
      case getch
      when " ", "\e[C" then next_slide
      when "\e[D"      then prev_slide
      when "a"         then first_slide
      when "d"         then last_slide
      when "j"         then jump_to
      when "w"         then wipe
      when "q", "\e"   then clear_and_exit
      end
    end

    def display(slide_number)
      clear
      self.current_slide = slide_number

      clear_and_exit if slides.length - 1 < current_slide

      slides.at(current_slide).display

      move_to(0, lines)
    end

    def jump_to
      move_to(0, lines)
      print "Jump to: "

      display(STDIN.gets.strip.to_i)
    end

    def next_slide
      display(current_slide + 1)
    end

    def prev_slide
      display(current_slide - 1)
    end

    def first_slide
      display(0)
    end

    def last_slide
      display(slides.size - 1)
    end

    def wipe
      display(current_slide)
    end
  end
end
