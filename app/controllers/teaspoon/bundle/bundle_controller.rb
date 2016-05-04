module Teaspoon::Bundle
  class BundleController < ActionController::Base
    def serve
      file = File.join(Teaspoon::Bundle.dir, 'teaspoon_bundle.js.erb')
      File.write(file, contents)

      asset = Rails.application.assets.find_asset(file)
      render js: asset.to_s
    end

    private
    def contents
      @suite = Teaspoon::Suite.new(params)
      contents = %Q{<% #{JSON.dump(@suite.spec_assets)}.each {|path| require_asset(path)} %>}
    end
  end
end
