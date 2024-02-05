require 'irb/completion'

IRB.conf[:AUTO_INDENT] = true

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:USE_AUTOCOMPLETE] = false


class Object
  def local_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end


def verbose!
  irb_context.echo = !irb_context.echo
end
