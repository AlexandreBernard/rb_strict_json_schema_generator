RSpec::Matchers.define :strictly_match_schema do |schema|
  match do |data|
    schema_dup = JSON.parse(schema.to_json, symbolize_names: true)

    JSON::Validator.validate!(JSON::StrictSchemaGenerator.call(schema_dup), data)
  end
end
