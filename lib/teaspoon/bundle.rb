require 'teaspoon/bundle/version'

module Teaspoon
  module Bundle
    ENDPOINT = "/teaspoon_bundle".freeze

    class << self
      def dir
        @dir ||= Dir.mktmpdir('teaspoon_bundle')
      end
    end
  end
end

require 'teaspoon/bundle/engine'
