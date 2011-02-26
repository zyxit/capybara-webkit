class Capybara::Driver::Webkit
  class Node < Capybara::Driver::Node
    def text
      invoke "text"
    end

    def [](name)
      invoke "attribute", name
    end

    def value
      invoke "value"
    end

    def set(value)
      raise NotImplementedError
    end

    # akephalos
    # def set(value)
    #   if tag_name == 'textarea'
    #     node.value = value.to_s
    #   elsif tag_name == 'input' and type == 'radio'
    #     click
    #   elsif tag_name == 'input' and type == 'checkbox'
    #     if value != self['checked']
    #       click
    #     end
    #   elsif tag_name == 'input'
    #     node.value = value.to_s
    #   end
    # end

    def select_option
      raise NotImplementedError
    end

    def unselect_option
      raise NotImplementedError
    end

    def click
      raise NotImplementedError
    end

    def drag_to(element)
      raise NotImplementedError
    end

    def tag_name
      invoke "tagName"
    end

    def visible?
      raise NotImplementedError
    end

    def path
      raise NotSupportedByDriverError
    end

    def trigger(event)
      raise NotSupportedByDriverError
    end

    def invoke(name, *args)
      browser.command "Node", name, native, *args
    end

    def browser
      driver.browser
    end
  end
end

