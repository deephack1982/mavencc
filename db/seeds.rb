# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Site.create!(company: 'AREUK', site: 'Darlington', license_type: '20', license_code: 'testtesttest', modules: { 'AMD' => true, 'Recording' => true, 'CRM Integration' => false })
