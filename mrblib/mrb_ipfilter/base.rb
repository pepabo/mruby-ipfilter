module IPFilter
  class Base
    def permit?(val)
      match?(@_permit, val)
    end

    def permit=(val)
      @_permit = val
    end

    def deny?(val)
      match?(@_deny, val)
    end

    def deny=(val)
      @_deny = val
    end

    def match?(list, val)
      list.include?(val)
    end
  end
end
