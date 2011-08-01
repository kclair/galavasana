require 'machinist/active_record'

Code.blueprint do
  snippet { "puts 'Hello, World#{sn}!'" }
end

