module IPFilter
  class UserAgent < Base
    def match?(list, v)
      list.find{ |l|v.include?(l) }
    end
  end
end
