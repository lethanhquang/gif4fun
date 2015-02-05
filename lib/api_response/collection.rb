module ApiResponse
  class Collection
    def initialize(collection, options = {})
      @collection = collection
      @options = options
    end

    def as_json
      @options.merge data: value
    end

    def value
      array.map do |value|
        Field.new(value).value
      end
    end

    def array
      @collection.class == Array ? @collection : @collection.as_json
    end
  end
end
