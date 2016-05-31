# Teaspoon::Bundle

A Teaspoon boot partial and controller that serves up all the test assets into a single JavaScript bundle.

## Usage

1. Add `teaspoon-bundle` to your `Gemfile` and run `bundle install`.
2. Add `suite.boot_partial = "bundle_boot"` to your `teaspoon_env.rb`.

## Known Issues

`teaspoon-bundle` is known to break code coverage provided by teaspoon.
