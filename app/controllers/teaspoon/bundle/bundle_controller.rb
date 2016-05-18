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
      contents = %Q{<% #{JSON.dump(assets)}.each {|path| require_asset(path)} %>}
    end

    def assets
      @suite.spec_assets.map {|asset| asset.split("?").first }
    end
  end
end
