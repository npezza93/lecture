# frozen_string_literal: true

center <<~SLIDE
  Hello


  This is a slide
SLIDE

center <<~SLIDE
  #{'Slide 2'.bold}


  This is the second slide
SLIDE

code(%(
  # app/controllers/posts_controller.rb

  class PostsController < ApplicationController
    def index
      @posts = Post.all
    end
  end
), lexer: :ruby)

section("This is a section") do
  center("This is a centered slide inside a section")
end

block("The lines in this block of text are\nnot centered")
