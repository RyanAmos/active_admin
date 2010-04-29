module ActiveAdmin
  class TableBuilder < IndexBuilder
    
    autoload :Column, 'active_admin/table_builder/column'
    
    attr_reader :columns
    
    def initialize
      @columns = []
      yield self if block_given?
    end
    
    def column(*args, &block)
      @columns << Column.new(*args, &block)
    end
    
    def display_method
      :active_admin_table
    end

    # Adds links to View, Edit and Delete
    def default_actions(options = {})
      options = {
        :name => ""
      }.merge(options)
      column options[:name] do 
        links = link_to "View", resource_path(resource)
        links += " | "
        links += link_to "Edit", edit_resource_path(resource)
        links += " | "
        links += link_to "Delete", resource_path(resource), :method => :destroy, :confirm => "Are you sure you want to delete this?"
        links
      end
    end
        
  end
end