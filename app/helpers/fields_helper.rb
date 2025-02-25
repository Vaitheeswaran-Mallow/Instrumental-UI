module FieldsHelper
  def container_attributes(local_assigns)
    {
      container_classes: local_assigns[:container_classes],
      data: local_assigns[:container_data]
    }
  end

  def field_attributes(local_assigns)
    {
      form: local_assigns[:form],
      field_name: local_assigns[:field_name],
      placeholder: local_assigns[:placeholder],
      autofocus: local_assigns[:autofocus],
      required: local_assigns[:required],
      value: local_assigns[:value],
      data: local_assigns[:field_data]
    }
  end

  def label_attributes(local_assigns, field_attributes)
    {
      no_label: local_assigns.fetch(:no_label, false),
      label_text: local_assigns[:label_text] || field_attributes[:field_name]&.to_s&.titleize,
      label_text_color: local_assigns[:label_text_color] || "text-gray-500",
      label_text_size: local_assigns[:label_text_size] || "text-base",
      label_weight: local_assigns[:label_weight] || "font-semibold",
      label_wrap: local_assigns.fetch(:label_wrap, false),
      label_display: local_assigns[:label_display] || (local_assigns.fetch(:label_wrap, false) ? "flex items-start" : "block"),
      label_classes: "#{local_assigns[:label_classes] || ''} #{local_assigns[:label_text_color] || 'text-gray-500'} #{local_assigns[:label_text_size] || 'text-base'} #{local_assigns[:label_weight] || 'font-semibold'} #{local_assigns[:label_display] || (local_assigns.fetch(:label_wrap, false) ? 'flex items-start' : 'block')}",
      label_value: local_assigns[:label_value],
      data: local_assigns[:label_data]
    }
  end

  def description_attributes(local_assigns)
    {
      description: local_assigns[:description],
      description_classes: local_assigns[:description_classes] || "text-sm text-gray-500 font-medium",
      description_above_field: local_assigns.fetch(:description_above_field, true),
      data: local_assigns[:description_data]
    }
  end

  def data_attributes_html(attributes)
    attributes[:data] ||= {}
    if attributes[:data].present?
      attributes[:data].map { |k, v| "data-#{k}=\"#{v}\"" }.join(' ').html_safe
    end
  end

  def merge_data_attributes(default_data, new_data)
    default_data.merge(new_data) do |key, old_val, new_val|
      "#{old_val} #{new_val}"
    end
  end

  def input_classes_with_xpend(prepend_content_present, append_content_present, additional_classes = "")
    base_classes = "flex-1 form-control"
    rounding_classes = if prepend_content_present && append_content_present
                         "rounded-none"
                       elsif prepend_content_present
                         "rounded-t-none xs:rounded-tl-none xs:rounded-bl-none xs:rounded-tr xs:rounded-br"
                       elsif append_content_present
                         "rounded-b-none xs:rounded-tl xs:rounded-bl xs:rounded-tr-none xs:rounded-br-none"
                       end
    "#{base_classes} #{rounding_classes} #{additional_classes}"
  end
end
