# frozen_string_literal: true

require "pygments.rb"
require "colorize"
require "io/console"
require "active_support/all"

require "lecture/version"
require "lecture/config"
require "lecture/terminal"
require "lecture/slide"

module Lecture
  mattr_writer :pygment_style, :character_print_delay, :slide_types,
               :transition_time, :section_header_text, :section_footer_text

  def self.character_print_delay
    @@character_print_delay || 0.018
  end

  def self.transition_time
    @@transition_time || 0.3
  end

  def self.pygment_style
    @@pygment_style || "paraiso-dark"
  end

  def self.slide_types
    @@slide_types ||= Set.new
  end

  def self.section_header_text
    @@section_header_text ||= " § "
  end

  def self.section_footer_text
    @@section_footer_text ||= " § "
  end

  def self.available_colors
    String.colors
  end

  def self.available_modes
    String.modes
  end

  def self.execute(deck)
    Runner.new(deck).execute
  end

  HELP = <<~HELP
    #{'VERSION'.bold} #{Lecture::VERSION}

    #{'NAME'.bold}
      lecture - Terminal Slideshow

    #{'SYNOPSIS'.bold}
      lecture [--help] <slides>.rb

    #{'OPTIONS'.bold}
      -h, --help
         Print this help

    #{'COMMANDS'.bold}
      Next slide:        SPC, Right Arrow
      Previous slide:    Left Arrow
      First slide:       a
      Last slide:        d
      Jump to slide:     j
      Reload slide:      w
      Quit:              q

    #{'SLIDE TYPES'.bold}
      code               Highlighted block of code
      center             All lines are centered on the screen
      block              The section of text is centered as whole
      section            A stylized section identifier slide
  HELP
end

require "lecture/slide/base"
require "lecture/slide/center"
require "lecture/slide/code"
require "lecture/slide/section"
require "lecture/slide/block"

require "lecture/runner"
