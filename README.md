# Strict JSON Schema Generator for Ruby

Strict JSON Schema Generator is an improved version of strict mode from https://github.com/voxpupuli/json-schema/

Strict Mode requires all fields by default, and does not allow additional properties that are not written in the schema

Strict Mode is what we want to ensure our JSON is correct in case we forget to define a field in our schema. JSON Schema does not really provide it

But the problem of voxpupuli Strict Mode is that - appart from being non standard - does not allow setting optional fields... :(

The approach of this lib is not to use this non standard Strict Mode but amends existing schemas instead to get to that result by requiring all defined fields

If required fields are specified, it does not override your original property and you can then select which fields are required... or not

## Installation

```
gem install strict_json_schema_generator
```

Gemfile
```
gem 'strict_json_schema_generator'
```

## Usage

The lib provides a class utility that returns your modified schema

```
modified_schema = JSON::StrictSchemaGenerator.call(schema_as_hash)
```

You can use the returned object with the usual validators:

```
JSON::Validator.validate!(modified_schema, data)
```

The lib also provide the corresponding RSpec matcher

```
expect(data_as_hash).to strictly_match_schema(schema_as_hash)
```
