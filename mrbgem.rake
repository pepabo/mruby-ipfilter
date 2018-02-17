MRuby::Gem::Specification.new('mruby-ipfilter') do |spec|
  spec.license = 'MIT'
  spec.authors = 'tahira'
  spec.add_dependency 'mruby-maxminddb', github: 'takumakume/mruby-maxminddb', branch: 'fix_builtin_test'
  spec.linker.libraries << 'maxminddb'
  spec.add_dependency 'mruby-mutex'
  spec.add_dependency 'mruby-io'
end
