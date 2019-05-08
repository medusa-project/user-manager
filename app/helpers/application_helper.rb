module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :success
      'alert-success'
    when :error
      'alert-danger'
    when :alert
      'alert-block'
    when :notice
      'alert-info'
    else
      flash_type.to_s
    end
  end

  ##
  # @param items [Enumerable<Hash>] Enumerable of hashes with :label and
  #                                 :url keys.
  # @return [String] Bootstrap breadcrumb component.
  #
  def breadcrumb(*items)
    html = StringIO.new
    html << '<nav aria-label="breadcrumb">'
    html <<   '<ol class="breadcrumb">'
    items.each_with_index do |item, index|
      if index < items.length - 1
        html << sprintf('<li class="breadcrumb-item"><a href="%s">%s</a></li>',
                        item[:url], item[:label])
      else
        html << sprintf('<li class="breadcrumb-item active" aria-current="page">%s</li>',
                        item[:label])
      end
    end
    html <<   '</ol>'
    html << '</nav>'
    raw(html.string)
  end

  ##
  # @return [String] Bootstrap alerts for each flash message.
  #
  def flashes
    html = StringIO.new
    flash.each do |type, message|
      html << "<div class=\"alert alert-dismissable #{bootstrap_class_for(type)}\" role=\"alert\">
          <button type=\"button\" class=\"close\" data-dismiss=\"alert\"
                  aria-label=\"Close\">
            <span aria-hidden=\"true\">&times;</span>
          </button>
          #{message}
        </div>"
    end
    raw(html.string)
  end

end
