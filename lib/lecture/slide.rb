# frozen_string_literal: true

module Lecture
  class Slide
    attr_accessor :content, :format, :options

    def initialize(content:, format:, **options)
      @content = content
      @format  = format
      @options = options
    end

    def display
      type_class.new(content: content, options: options).display
    end

    private

    def type_class
      "Lecture::Slide::#{format.to_s.classify}".constantize
    end
  end
end
