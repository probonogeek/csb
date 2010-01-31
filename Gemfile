# Edit this Gemfile to bundle your application's dependencies.
directory "/home/niles/dev/rails", :glob => "{*/,}*.gemspec"
git "git://github.com/rails/arel.git"
git "git://github.com/rails/rack.git"

gem "rails", "3.0.pre"
gem "rspec-rails", "2.0.0.a3"

## Bundle edge rails:
# gem "rails", :git => "git://github.com/rails/rails.git"

## Bundle the gems you use:
# gem "bj"
# gem "hpricot", "0.6"
# gem "sqlite3-ruby", :require_as => "sqlite3"
# gem "aws-s3", :require_as => "aws/s3"

## Bundle gems used only in certain environments:
# gem "rspec", :only => :test
only :test do
  gem "webrat"
  gem "machinist"
  gem "faker"
end
