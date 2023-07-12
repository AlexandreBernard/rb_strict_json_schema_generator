Gem::Specification.new do |s|
  s.name          = 'strict_json_schema_generator'
  s.version       = '1.0.1'
  s.licenses      = ['MIT']
  s.summary       = 'Transforms a JSON Schema to require all fields when not specified'
  s.description   = 'Ease the pain from manually requiring all fields in a JSON Schema when no required field list is specified'
  s.authors       = ['Alexandre Bernard']
  s.email         = 'archiduc@alexandrebernard.com'
  s.require_path  = 'lib'
  s.files         = Dir['lib/**/*']
  s.homepage      = 'https://github.com/AlexandreBernard/rb_strict_json_schema_generator'
  s.metadata      = { 'source_code_uri' => 'https://github.com/AlexandreBernard/rb_strict_json_schema_generator' }
  s.required_rubygems_version = '>= 2.5'
  
  s.add_runtime_dependency 'json-schema', '~> 4.0'
end
