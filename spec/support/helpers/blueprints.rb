require 'faker'
# require 'sham'
require 'machinist/active_record'

Brewery.blueprint do
  name { Faker::Name.name }
end

Style.blueprint do
  name { Faker::Name.name }
  brewery
end

Batch.blueprint do
  style
  brewed_at { Time.now }
  volume { rand(10) }
end

Beer.blueprint do
  name { Faker::Name.name }
  batch
end