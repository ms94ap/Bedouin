class Resource < ApplicationRecord

  def initialize(controller_path, controller_name, parent_model, object_name = nil)
    @controller_path = controller_path
    @controller_name = controller_name
    @parent_model = parent_model
    @object_name = object_name
  end

  def model_class
    sub_namespace = sub_namespace_parts.map(&:capitalize).join('::')
    sub_namespace = "#{sub_namespace}::" unless sub_namespace.empty?
    ":#{sub_namespace}#{@controller_name.classify}".constantize
  end

end