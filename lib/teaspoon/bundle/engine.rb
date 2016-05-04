require 'teaspoon/bundle'

module Teaspoon
  module Bundle
    class Engine < ::Rails::Engine
      isolate_namespace ::Teaspoon::Bundle

      routes do
        match "/:suite", to: 'bundle#serve', via: :get
      end

      initializer :assets, group: :all do |app|
        app.config.assets.paths << Teaspoon::Bundle.dir
      end

      config.after_initialize do |app|
        app.routes.prepend do
          require Teaspoon::Bundle::Engine.root.join("app/controllers/teaspoon/bundle/bundle_controller")
          mount Teaspoon::Bundle::Engine => Teaspoon::Bundle::ENDPOINT, as: 'teaspoon_bundle'
        end
      end
    end
  end
end
