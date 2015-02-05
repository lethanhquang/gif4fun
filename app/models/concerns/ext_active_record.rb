module ExtActiveRecord
  extend ActiveSupport::Concern

  included do
    scope :sorted, lambda { |params|
      sort_by = params[:sort_by]
      sort_dir = params[:sort_dir]

      order(sort_by.to_sym => sort_dir.to_sym) if sort_by && sort_dir
    }
  end

  def as_json_api(params)
    as_json(self.class.params_to_options(params))
  end

  module ClassMethods
    def as_json_api(params)
      all.as_json(params_to_options(params))
    end

    def params_to_options(params)
      options = {}
      options[:include] = extract_include_param params[:include] if params[:include]
      options[:only]    = params[:only] if params[:only]
      options = merge_options options, extract_methods_param(params[:methods]) if params[:methods]

      options
    end

    def extract_include_param(value)
      if value.is_a?(String) && value.include?('.')
        val1, val2 = value.split '.'
        { val1 => { include: val2 } }
      elsif value.is_a?(Array)
        value.map! { |v| extract_include_param(v) }
      else
        value
      end
    end

    def extract_methods_param(value)
      if value.is_a? String
        extract_methods_param_string value
      elsif value.is_a? Array
        # val_dot, val = value.partition{ |v| v.include? '.' }
        # { methods: val }
        merge_multi_options(*value.map { |v| extract_methods_param_string v })
      end
    end

    def extract_methods_param_string(value)
      if value.include? '.'
        val = value.split '.'

        case val.size
        when 2
          { include: [{ val[0] => { methods: val[1] } }] }
        when 3
          { include: [{ val[0] => { include: { val[1] => { methods: val[2] } } } }] }
        end
      else
        { methods: value }
      end
    end
    # protected

    def merge_multi_options(*args)
      args.inject { |a, e| merge_options a, e }
    end

    def merge_options(target, source)
      target.merge(source) do |_, this_val, other_val|
        merge_value this_val, other_val
      end
    end

    def merge_value(this_val, other_val)
      if this_val.is_a?(Hash) && other_val.is_a?(Hash)
        merge_options this_val, other_val
      else
        merge_array this_val, other_val
      end
    end

    def merge_array(this_val, other_val)
      this_val = [this_val] if this_val.is_a?(Hash)
      other_val = [other_val] if other_val.is_a?(Hash)

      reduce_array((Array(this_val) + Array(other_val)).uniq)
    end

    def reduce_array(arr)
      hash, array = {}, []

      arr.each do |n|
        if n.is_a? Hash
          hash = merge_value hash, n
        else
          array << n
        end
      end

      hash_to_array(hash) + array
    end

    def hash_to_array(hash)
      hash.map do |key, value|
        { key => value }
      end
    end
  end
end

