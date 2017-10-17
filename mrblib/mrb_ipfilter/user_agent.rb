module IPFilter
  class UserAgent < Base
    def match?(list, v)
      v = '' if v.nil?
      list.find{ |l|v.include?(l) }
    end
  end
end
