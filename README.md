# Adapter::YAML

YAML support for [https://github.com/jnunemaker/adapter](https://github.com/jnunemaker/adapter)

## Installation

Add this line to your application's Gemfile:

    gem 'adapter-yaml'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install adapter-yaml

## Usage

Usage is pretty simple:
```
require 'adapter/yaml'

client = YAML::Store.new('kv.yml')

adapter = Adapter[:yaml].new(client)
adapter.write('foo', 'bar')
p adapter.read('foo')
```

Or under the hood in [https://github.com/jnunemaker/toystore](https://github.com/jnunemaker/toystore):
```
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
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
