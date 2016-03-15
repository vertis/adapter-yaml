$:.unshift 'lib'
require 'pp'
require 'adapter/yaml'
require 'toystore'

class User
  include Toy::Store
  adapter :yaml, YAML::Store.new('kv.yml')

  attribute :name, String
end

user = User.create(:name => 'John')

pp user
pp User.read(user.id)

user.destroy
pp User.read(user.id)
