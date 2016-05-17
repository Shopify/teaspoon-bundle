require 'teaspoon/bundle/version'
require 'fileutils'

module Teaspoon
  module Bundle
    ENDPOINT = "/teaspoon_bundle".freeze

    class << self
      def dir
        @dir ||= create_dir
      end

      private
        def create_dir
          dir = Rails.root.join('tmp/teaspoon-bundle')
          FileUtils.mkdir_p dir
          dir
        end
    end
  end
end

require 'teaspoon/bundle/engine'
