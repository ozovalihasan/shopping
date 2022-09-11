class CustomControllerGenerator < Rails::Generators::NamedBase
  desc "This generator creates a controller for views rendered by using view_component"
  
  source_root File.expand_path("templates", __dir__)

  check_class_collision suffix: "Component"  
  class_option :attributes, type: :hash, default: {}
  argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"
  
  def create_component_file
    # Template method
    # First argument is the name of the template
    # Second argument is where to create the resulting file. In this case, app/components/my_component.rb

    template "controller.rb", File.join("app/controllers", "#{file_name.pluralize}_controller.rb")
    template "edit_component.html.erb", File.join("app/components/#{file_name.pluralize}", "edit_component.html.erb")
    template "edit_component.rb", File.join("app/components/#{file_name.pluralize}", "edit_component.rb")
    template "form_component.html.erb", File.join("app/components/#{file_name.pluralize}", "form_component.html.erb")
    template "form_component.rb", File.join("app/components/#{file_name.pluralize}", "form_component.rb")
    template "index_component.html.erb", File.join("app/components/#{file_name.pluralize}", "index_component.html.erb")
    template "index_component.rb", File.join("app/components/#{file_name.pluralize}", "index_component.rb")
    template "new_component.html.erb", File.join("app/components/#{file_name.pluralize}", "new_component.html.erb")
    template "new_component.rb", File.join("app/components/#{file_name.pluralize}", "new_component.rb")
    template "class_name_component.html.erb", File.join("app/components/#{file_name.pluralize}", "#{file_name}_component.html.erb")
    template "class_name_component.rb", File.join("app/components/#{file_name.pluralize}", "#{file_name}_component.rb")
    template "show_component.html.erb", File.join("app/components/#{file_name.pluralize}", "show_component.html.erb")
    template "show_component.rb", File.join("app/components/#{file_name.pluralize}", "show_component.rb")
  end

  def reference_attributes
    attributes.select {|attribute| attribute.type == :references}
  end

  def attributes_without_references
    attributes.select {|attribute| attribute.type != :references}
  end
  
end
