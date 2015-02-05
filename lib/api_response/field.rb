module ApiResponse
  class Field
    def initialize(value)
      @value = value
    end

    def value
      case @value
      when ActiveSupport::TimeWithZone
        @value.to_i
      when Date
        @value.to_time(:utc).to_i
      when Array
        Collection.new(@value).value
      when Hash
        Resource.new(@value).value
      else
        @value
      end
    end
  end
end
