module Teaspoon::Bundle
  class BundleController < ActionController::Base
    skip_forgery_protection if default_protect_from_forgery

    def serve
      file = File.join(Teaspoon::Bundle.dir, "teaspoon_bundle_#{params[:suite]}.js.erb")
      File.write(file, contents)
      begin
        asset = Rails.application.assets.find_asset(file, accept: 'application/javascript')
        render js: asset.to_s
      ensure
        File.delete(file)
      end
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
