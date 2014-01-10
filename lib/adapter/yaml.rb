require "yaml/store"
require "adapter"

module Adapter
  module YAML
    def key?(key, options = nil)
      client.transaction(true) { client.root?(key) }
    end
    
    def read(key, options = nil)
      client.transaction(true) { client[key] }
    end

    def write(key, attributes, options = nil)
      client.transaction { client[key] = attributes }
    end

    def delete(key, options = nil)
      client.transaction { client.delete(key) }
    end

    def clear(options = nil)
      client.transaction do
        client.roots.each do |key|
          client.delete(key)
        end
      end
    end
  end
end

Adapter.define(:yaml, Adapter::YAML)
