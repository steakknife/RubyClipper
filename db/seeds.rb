# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

# EmailBlacklistIPRange
[
'207.198.106.56', # mailinator.com
].map { |value| EmailBlacklistIpRange.create! value: value }

# EmailBlacklistDomain
%w[
deadaddress\.com
sharklasers\.com
mailinator\.com
yopmail\.com
].map { |value| EmailBlacklistDomain.create! value: value }
