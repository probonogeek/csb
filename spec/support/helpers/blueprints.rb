require 'faker'
require 'sham'
require 'machinist/active_record'

Sham.name { Faker::Name.name }
Sham.title { Faker::Lorem.sentence }

Brewery.blueprint do
  name { Sham.name }
end

Style.blueprint do
  name { Sham.name }
  brewery { Brewery.make }
end

Batch.blueprint do
  style { Style.make }
end

Beer.blueprint do
  batch { Batch.make }
end