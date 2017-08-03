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
end
