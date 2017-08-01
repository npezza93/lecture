# frozen_string_literal: true

module Lecture
  class Slide
    class Base
      include Terminal

      attr_accessor :content, :options

      class << self
        def inherited(base)
          Lecture.slide_types.add(base.to_s.demodulize.downcase.to_sym)
        end
      end

      def initialize(content:, options:)
        @content = content
        @options = options.with_indifferent_access
      end

      def display
        raise(
          NotImplementedError,
          "self.#{__method__} must be implemented by including class."
        )
      end

      private

      def method_missing(method_name, *arguments, &block)
        if options.key?(method_name)
          options[method_name]
        else
          super
        end
      end

      def respond_to_missing?(method_name, include_private = false)
        options.key?(method_name) || super
      end
    end
  end
end
