module JSON
  class StrictSchemaGenerator
    attr_reader :schema

    # beware that the provided object must have symbol keys and will be modified
    def self.call(schema)
      new(schema).strictify!
    end

    def initialize(schema)
      @schema = schema
    end

    def strictify!
      set_strict_attributes_for(schema)

      schema
    end

    private

    def type
      @type ||= schema[:type].to_s
    end

    def object?
      type == 'object'
    end

    def object_with_properties?
      object? && schema[:properties].is_a?(Hash)
    end

    def set_strict_attributes_for(schema_subset)
      set_object_strict_attributes(schema_subset)

      schema_subset.each do |_key, subset|
        case subset
        when Hash
          self.class.call(subset)
        when Array
          subset.each do |item|
            self.class.call(item) if item.is_a?(Hash)
          end
        end
      end
    end

    def set_object_strict_attributes(schema_subset)
      return unless object_with_properties?

      schema_subset.merge!(
        required: schema_subset[:required] || schema_subset[:properties].keys,
        additionalProperties: false
      )

      schema_subset[:properties].each do |_, property|
        self.class.call(property)
      end
    end
  end
end
