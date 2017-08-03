# frozen_string_literal: true

require "pygments.rb"
require "colorize"
require "io/console"
require "active_support/all"

require "lecture/version"
require "lecture/terminal"
require "lecture/slide"

module Lecture
  CHARACTER_PRINT_DELAY = 0.018

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
      code
      center
      block
      section
  HELP
end

require "lecture/slide/base"
require "lecture/slide/center"
require "lecture/slide/code"
require "lecture/slide/section"
require "lecture/slide/block"
