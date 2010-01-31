require 'faker'
require 'sham'
require 'machinist/active_record'

Sham.name { Faker::Name.name }
Sham.title { Faker::Lorem.sentence }

Brewery.blueprint do
  name { Sham.name }
end