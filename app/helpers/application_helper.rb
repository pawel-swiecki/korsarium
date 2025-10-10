module ApplicationHelper
  #Custom helper that wraps button_to with <wa-button> for styling purposes
  def wa_button_to(name = nil, options = nil, html_options = nil, &block)
    if block_given?
      html_options = options
      options = name
      name = capture(&block)
    end

    standard_output = button_to(name, options, html_options)

    standard_output.gsub(/<button/, '<wa-button').gsub(/<\/button>/, '</wa-button>').html_safe
  end
end
