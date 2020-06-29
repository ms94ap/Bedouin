class Admin::ResourceController < ApplicationController

  protected

  class << self
    attr_accessor :parent_data
    
    def belongs_to(model_name, options = {})
      @parent_data ||= {}
      @parent_data[:model_name] = model_name
      @parent_data[:model_class] = model_name.to_s.classify.constantize
      @parent_data[:find_by] = options[:find_by] || :id
    end
    
  end
  
  def parent_data
    self.class.parent_data
  end

  def parent
    if parent_data.present?
      @parent ||= parent_data[:model_class].
                  send(:find_by, parent_data[:find_by].to_s => params["#{resource.model_name}_id"])
      instance_variable_set("@#{resource.model_name}", @parent)
    end
  end

end