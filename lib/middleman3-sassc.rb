require 'middleman-core'

Middleman::Extensions.register(:sassc) do
  require 'middleman3-sassc/extension'
  Middleman3::SassC::Extension
end