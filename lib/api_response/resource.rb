module ApiResponse
  class Resource
    def initialize(obj, options = {})
      @obj = obj
      @options = options
    end

    def as_json
      @options.merge object: value
    end

    def value
      Hash[hash.map do |key, value|
        [key, Field.new(value).value]
      end]
    end

    def hash
      @obj.class == Hash ? @obj : @obj.as_json
    end
  end
end
