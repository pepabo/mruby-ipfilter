module IPFilter
  class CountryFromIP < Base
    def initialize(db_path, retry_usleep=50000, retry_count=10)
      @_m = Mutex.new :global => true
      @retry_usleep = retry_usleep
      @retry_count = retry_count
      @_db = MaxMindDB.new db_path
    end

    def permit?(val)
      lock_do(val) do
        super(@_db.country_code)
      end
    end

    def deny?(val)
      lock_do(val) do
        super(@_db.country_code)
      end
    end

    def lock_do(val, &block)
      r = false
      @_m.try_lock_loop(@retry_usleep, @retry_usleep * @retry_count) do
        @_db.lookup_string val
        r = block.call
      end
      @_m.unlock
      r
    end
  end
end
