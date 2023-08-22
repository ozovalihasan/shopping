module CustomHintsComponent
  # To avoid deprecation warning, you need to make the wrapper_options explicit
  # even when they won't be used.
  def custom_hints(wrapper_options = nil)
    @custom_hints ||= begin
      custom_hints = options[:custom_hints]&.compact || []
      custom_hints << "#{input_html_options[:minlength]} characters minimum" if input_html_options[:minlength]

      unless custom_hints.empty?
        tooltip = html_escape(custom_hints.map{|custom_hint| "- " + custom_hint}.join("\n"))
        
        template.content_tag( :div, class: "aspect-square fill-first-500 mx-4 h-4", title: tooltip) do
          template.render(Icons::QuestionMarkRounded::Component.new)
        end
      end
    end
  end

end

SimpleForm.include_component(CustomHintsComponent)