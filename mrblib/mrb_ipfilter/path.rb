module IPFilter
  class Path < Base
    def match?(list, v)
      list.find{ |l|v.include?(l) }
    end
  end
end
