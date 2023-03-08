# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Doorkeeper::Application.count.zero?
    Doorkeeper::Application.create(name: "iOS client", redirect_uri: "", scopes: "")
    Doorkeeper::Application.create(name: "Android client", redirect_uri: "", scopes: "")
    Doorkeeper::Application.create(name: "React", redirect_uri: "", scopes: "")
end