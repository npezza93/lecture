module Lecture
  class Config
    def character_print_delay=(value)
      Lecture.character_print_delay = value
    end

    def transition_time=(value)
      Lecture.transition_time = value
    end

    def pygment_style=(value)
      Lecture.pygment_style = value
    end

    def section_header_text=(value)
      Lecture.section_header_text = value
    end

    def section_footer_text=(value)
      Lecture.section_footer_text = value
    end
  end
end
